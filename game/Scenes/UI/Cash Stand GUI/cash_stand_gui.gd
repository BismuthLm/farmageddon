extends Node2D

var sell_10_carrots: bool = false
var sell_1_carrot: bool = false
var buy_1_carrot: bool = false
var buy_10_carrots: bool = false
var sell_10_beetroots: bool = false
var sell_1_beetroot: bool = false
var buy_1_beetroot: bool = false
var buy_10_beetroots: bool = false

func _process(_delta):
	
	if Globals.cash_stand == true:
		$".".visible = true
		$".".position = Globals.player_pos
		
	if Globals.cash_stand == false:
		$".".visible = false
	
	#If left click input is pressed and the mouse is inside a box it does that action
	
	if Input.is_action_just_pressed("left click"):
		sell_10_carrots_func()
		sell_1_carrot_func()
		buy_1_carrot_func()
		buy_10_carrots_func()
		sell_10_beetroots_func()
		sell_1_beetroot_func()
		buy_1_beetroot_func()
		buy_10_beetroots_func()

func sell_10_carrots_func():
	if sell_10_carrots == true:
		if Globals.carrot_amount >= 10:
			Globals.carrot_amount -= 10
			Globals.gold_amount += 30
		else:
			print("Can't sell 10 carrots, not enough in your inventory")

func sell_1_carrot_func():
	if sell_1_carrot == true:
		if Globals.carrot_amount >= 1:
			Globals.carrot_amount -= 1
			Globals.gold_amount += 3
		else:
			print("Can't sell 1 carrot, not enough in your inventory")

func buy_1_carrot_func():
	if buy_1_carrot == true:
		if Globals.gold_amount >= 5:
			Globals.gold_amount -= 5
			Globals.carrot_amount += 1
		else:
			print("Can't buy 1 carrot, not enough gold")

func buy_10_carrots_func():
	if buy_10_carrots == true:
		if Globals.gold_amount >= 50:
			Globals.gold_amount -= 50
			Globals.carrot_amount += 10
		else:
			print("Can't buy 10 carrots, not enough gold")

func sell_10_beetroots_func():
	if sell_10_beetroots == true:
		if Globals.beetroot_amount >= 10:
			Globals.beetroot_amount -= 10
			Globals.gold_amount += 50
		else:
			print("Can't sell 10 beetroots, not enough in your inventory")

func sell_1_beetroot_func():
	if sell_1_beetroot == true:
		if Globals.beetroot_amount >= 1:
			Globals.beetroot_amount -= 1
			Globals.gold_amount += 5
		else:
			print("Can't sell 1 beetroot, not enough in your inventory")

func buy_1_beetroot_func():
	if buy_1_beetroot == true:
		if Globals.gold_amount >= 10:
			Globals.gold_amount -= 10
			Globals.beetroot_amount += 1
		else:
			print("Can't buy 1 beetroot, not enough gold")

func buy_10_beetroots_func():
	if buy_10_beetroots == true:
		if Globals.gold_amount >= 100:
			Globals.gold_amount -= 100
			Globals.beetroot_amount += 10
		else:
			print("Can't buy 10 beetroots, not enough gold")

#When the mouse enters an area its variable turns from false to true and when the mouse exits the area it turns it from false to true
func _on_sell_10_carrots_mouse_entered():
	sell_10_carrots = true
	print("mouse entered")

func _on_sell_10_carrots_mouse_exited():
	sell_10_carrots = false
	print("mouse exited")

func _on_sell_1_carrot_mouse_entered():
	sell_1_carrot = true

func _on_sell_1_carrot_mouse_exited():
	sell_1_carrot = false

func _on_buy_1_carrot_mouse_entered():
	buy_1_carrot = true

func _on_buy_1_carrot_mouse_exited():
	buy_1_carrot = false

func _on_buy_10_carrots_mouse_entered():
	buy_10_carrots = true

func _on_buy_10_carrots_mouse_exited():
	buy_10_carrots = false

func _on_sell_10_beetroots_mouse_entered():
	sell_10_beetroots = true

func _on_sell_10_beetroots_mouse_exited():
	sell_10_beetroots = false

func _on_sell_1_beetroot_mouse_entered():
	sell_1_beetroot = true

func _on_sell_1_beetroot_mouse_exited():
	sell_1_beetroot = false

func _on_buy_1_beetroot_mouse_entered():
	buy_1_beetroot = true

func _on_buy_1_beetroot_mouse_exited():
	buy_1_beetroot = false

func _on_buy_10_beetroots_mouse_entered():
	buy_10_beetroots = true

func _on_buy_10_beetroots_mouse_exited():
	buy_10_beetroots = false
