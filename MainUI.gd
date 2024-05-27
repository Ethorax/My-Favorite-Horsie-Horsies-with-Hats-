extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_cancel")):
		$ActivitiesWindow.hide()
		$CustomizeWindow.hide()
		$ShopWindow.hide()

func _on_customize_button_button_down():
	$CustomizeWindow.show()


func _on_activities_button_button_down():
	$ActivitiesWindow.show()


func _on_shop_button_button_down():
	$ShopWindow.show()
