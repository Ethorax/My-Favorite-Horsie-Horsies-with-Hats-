extends RigidBody3D





# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if(body.is_in_group("Horse") and Global.pony_hunger < 100):
		body.clean_up_food()
		
		Global.pony_hunger +=20
		Global.money += 20
		if(Global.pony_hunger>100):
			Global.pony_hunger=100
		
		queue_free()
