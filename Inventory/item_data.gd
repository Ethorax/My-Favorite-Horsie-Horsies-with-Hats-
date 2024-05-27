extends Resource
class_name ItemData


@export var name: String = ""
@export_multiline var description : String = ""
@export var item: String
@export_enum("Head", "Face", "Feet") var clothing_slot: String
