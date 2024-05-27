extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		$"Brushing MiniGame".hide()


func _on_food_button_button_down():
	Global.feed = true




func _on_brush_button_button_down():
	$"Brushing MiniGame".show()
