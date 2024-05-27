extends PanelContainer

const Slot = preload("res://Inventory/Slot.tscn")

@onready var item_grid = $VBoxContainer/HBoxContainer/VScrollBar/PanelContainer/GridContainer

var inv_data = preload("res://Inventory/test_inventory.tres")


func _ready():
	
	populate_item_grid(inv_data.slot_datas)
	Global.inventory_ui = self

func populate_item_grid(slot_datas: Array[SlotData]) -> void:
	for child in item_grid.get_children():
		child.queue_free()
		
	for slot_data in slot_datas:
		
		var slot = Slot.instantiate()
		item_grid.add_child(slot)
		
		if slot_data:
			slot.set_slot_data(slot_data)
			
			

func add_item(item : ItemData):
	
	var new_item = SlotData.new()
	
	new_item.item_data = item
	
	for i in inv_data.slot_datas.size()-1:
		print(inv_data.slot_datas[i])
		if inv_data.slot_datas[i] == null:
			inv_data.slot_datas[i] = new_item
			populate_item_grid(inv_data.slot_datas)
			break
