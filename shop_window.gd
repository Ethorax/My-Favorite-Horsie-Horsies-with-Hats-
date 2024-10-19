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
		var dir = DirAccess.open("res://Clothes/")
		var hat_list = []
		if dir:
			dir.list_dir_begin()
			var file_name = dir.get_next()
			while file_name != "":
				if dir.current_is_dir():
					print("Found directory: " + file_name)
				else:
				
					
					print("Found file: " + file_name)
					
					file_name = file_name.replace(".remap","")
					
					if(file_name.ends_with(".tres")):
						hat_list.append("res://Clothes/"+file_name)
					
					
					
					
				file_name = dir.get_next()
		else:
			print("An error occurred when trying to access the path.")
		var current_hat = hat_list.pick_random()
		print(current_hat)
		Global.inventory_ui.add_item(load(current_hat))
