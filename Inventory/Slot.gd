extends PanelContainer

#signal slot_clicked(index: int, button: int)
var slot_item : ItemData
@onready var sub_viewport = $SubViewportContainer/SubViewport
@onready var camera_3d = $SubViewportContainer/SubViewport/Node3D/Camera3D
@onready var view_holder = $SubViewportContainer/SubViewport/Node3D

	
func set_slot_data(slot_data : SlotData) -> void:
	var item_data = slot_data.item_data as ItemData
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	slot_item = item_data
	var slot_image = load(slot_item.item).instantiate()
	slot_image.global_position = $SubViewportContainer/SubViewport/Node3D/MeshInstance3D.global_position
	view_holder.add_child(slot_image)
	
	view_holder.position = Vector3(0,-1000*Global.slot_index,0)
	Global.slot_index += 1
	
	$SubViewportContainer.show()


func _on_gui_input(event):
	if event is InputEventMouseButton and ((event.button_index == MOUSE_BUTTON_LEFT) or (event.button_index == MOUSE_BUTTON_RIGHT)) and event.is_pressed():
		#slot_clicked.emit(get_index(), event.button_index)
		if(slot_item != null):
			Global.head_wear = slot_item.item
			print("item pressed")
			print(Global.head_wear)
