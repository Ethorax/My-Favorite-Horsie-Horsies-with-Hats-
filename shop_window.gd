extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_button_up():
	if(Global.money>=100):
		Global.money -=100
		Global.inventory_ui.add_item(load("res://Clothes/tophat.tres"))
