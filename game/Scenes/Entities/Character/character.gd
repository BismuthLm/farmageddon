extends CharacterBody2D
## Player controller with smooth movement, sprint, mouse/keyboard-friendly animation,
## day/night light tweening, interaction hooks, and optional footstep sounds.

signal facing_changed(new_facing: String)
signal interacted

# -- Movement ---------------------------------------------------------
@export var max_speed: float = 325.0
@export var sprint_multiplier: float = 1.6
@export var acceleration: float = 2400.0
@export var friction: float = 3000.0
@export var enable_inertia: bool = true
@export var enable_sprint: bool = true   # Requires "sprint" Input action

# -- Light (PointLight2D) ---------------------------------------------
@export var night_start_hour: int = 12   # original behavior: night from >= 12
@export var day_start_hour: int = 7      # and before < 7
@export var day_energy: float = 0.0
@export var night_energy: float = 2.5
@export var light_lerp_speed: float = 2.25

# -- Footsteps (optional) ---------------------------------------------
@export var footstep_enabled: bool = true
@export var base_footstep_interval: float = 0.35  # seconds at normal speed

# -- Animation names (customize to your project) ----------------------
const ANIM_WALK := {
	"Left":  "Walking Left",
	"Right": "Walking Right",
	"Up":    "Walking Backwards",
	"Down":  "Walking Forward",
}
const IDLE_SEEK := {  # where to pause in each walk anim to show idle frame
	"Left":  0.2,
	"Right": 0.2,
	"Up":    0.2,
	"Down":  0.4,
}

# -- Cached nodes ------------------------------------------------------
@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var light: PointLight2D = $PointLight2D
@onready var footstep_player: AudioStreamPlayer2D = get_node_or_null("Footstep")

# -- Internals ---------------------------------------------------------
var _input_vec: Vector2 = Vector2.ZERO
var _last_facing: String = "Down"
var _step_timer: float = 0.0

func _ready() -> void:
	# Start with a sensible idle frame
	_set_idle_frame()

func _process(delta: float) -> void:
	_update_light(delta)

func _physics_process(delta: float) -> void:
	_read_input()
	_move_player(delta)
	_update_animation()
	_handle_interact_action()
	_update_footsteps(delta)
	Globals.player_pos = global_position  # keep original behavior

# ---------------------------------------------------------------------
# Light & Time-of-day
# ---------------------------------------------------------------------
func _update_light(delta: float) -> void:
	if not light:
		return
	var is_night := _is_night_time()
	var target := night_energy if is_night else day_energy
	light.energy = move_toward(light.energy, target, light_lerp_speed * delta)

func _is_night_time() -> bool:
	# Mirrors original rule by default (>= night_start_hour OR < day_start_hour).
	var t := int(Globals.time_of_day)
	return t >= night_start_hour or t < day_start_hour

# ---------------------------------------------------------------------
# Input & Movement
# ---------------------------------------------------------------------
func _read_input() -> void:
	# Note: Godot's Input.get_vector order is (neg_x, pos_x, neg_y, pos_y).
	_input_vec = Input.get_vector("left", "right", "up", "down")
	# Choose facing based on dominant axis; keeps diagonals consistent
	if _input_vec != Vector2.ZERO:
		if absf(_input_vec.x) > absf(_input_vec.y):
			_last_facing = "Right" if _input_vec.x > 0.0 else "Left"
		else:
			_last_facing = "Down" if _input_vec.y > 0.0 else "Up"

func _move_player(delta: float) -> void:
	var sprinting := enable_sprint and Input.is_action_pressed("sprint")
	var speed_cap := max_speed * (sprint_multiplier if sprinting else 1.0)
	var desired_velocity: Vector2 = _input_vec * speed_cap

	if enable_inertia:
		var accel_rate := acceleration if _input_vec != Vector2.ZERO else friction
		var diff := desired_velocity - velocity
		var max_change := accel_rate * delta
		velocity += diff.clamped(max_change)
	else:
		velocity = desired_velocity

	move_and_slide()

# ---------------------------------------------------------------------
# Animation
# ---------------------------------------------------------------------
func _update_animation() -> void:
	if not anim:
		return

	if _input_vec != Vector2.ZERO:
		var anim_name := ANIM_WALK.get(_last_facing, "")
		if anim_name != "" and (anim.current_animation != anim_name or not anim.is_playing()):
			anim.play(anim_name)
			emit_signal("facing_changed", _last_facing)
	else:
		_set_idle_frame()

func _set_idle_frame() -> void:
	if not anim:
		return
	var anim_name := ANIM_WALK.get(_last_facing, "")
	if anim_name == "":
		return
	if anim.current_animation != anim_name:
		anim.play(anim_name)
	anim.pause()
	anim.seek(IDLE_SEEK.get(_last_facing, 0.2), true)

# ---------------------------------------------------------------------
# Footsteps (optional)
# ---------------------------------------------------------------------
func _update_footsteps(delta: float) -> void:
	if not footstep_enabled or footstep_player == null:
		return

	if _input_vec == Vector2.ZERO or velocity.length_squared() < 1.0:
		_step_timer = 0.0
		return

	# Faster movement = faster steps
	var speed_ratio := clampf(velocity.length() / (max_speed * sprint_multiplier), 0.3, 1.7)
	var interval := base_footstep_interval / speed_ratio

	_step_timer -= delta
	if _step_timer <= 0.0:
		_step_timer = interval
		# Slight pitch variation for liveliness
		footstep_player.pitch_scale = randf_range(0.95, 1.05)
		footstep_player.play()

# ---------------------------------------------------------------------
# Interactions
# ---------------------------------------------------------------------
func _handle_interact_action() -> void:
	# Optional: define an "interact" action to use this at runtime
	if Input.is_action_just_pressed("interact") and Globals.interactable:
		emit_signal("interacted")

# ---------------------------------------------------------------------
# Existing signals from your Area2D (kept for compatibility)
# ---------------------------------------------------------------------
func _on_interactable_area_mouse_entered() -> void:
	Globals.interactable = true

func _on_interactable_area_mouse_exited() -> void:
	Globals.interactable = false
