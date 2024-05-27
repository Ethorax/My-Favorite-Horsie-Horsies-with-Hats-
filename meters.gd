extends Control

@onready var nums = $HBoxContainer/HBoxContainer/Nums
@onready var love = $HBoxContainer/HBoxContainer2/Love
@onready var neatness = $HBoxContainer/HBoxContainer3/Neatness

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if(nums.value!=Global.pony_hunger):
		nums.value = Global.pony_hunger
	if(love.value!=Global.pony_love):
		love.value = Global.pony_love
	if(neatness.value!=Global.pony_clean):
		neatness.value = Global.pony_clean
