extends Node3D

@onready var hay = preload("res://Hay.tscn")

var rng = RandomNumberGenerator.new()
@onready var food_spawn_area = $Area3D/CollisionShape3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Global.feed):
		Global.feed = false
		var hay_instance = hay.instantiate()
		print("Food away!")
		hay_instance.position = Vector3(randi_range(food_spawn_area.position.x - food_spawn_area.shape.size.x/2, food_spawn_area.position.x + food_spawn_area.shape.size.x/2),food_spawn_area.position.y,randi_range(food_spawn_area.position.z - food_spawn_area.shape.size.z/2, food_spawn_area.position.z + food_spawn_area.shape.size.z/2))
		get_tree().root.get_child(1).add_child(hay_instance)
		Global.foods.append(hay_instance)
		
		


func _on_love_timer_timeout():
	Global.pony_love -=5
	Global.pony_hunger -= 5
	$LoveTimer.start()
	


func _on_button_button_down():
	print("Off to the Horse race!")
	get_tree().change_scene_to_file("res://horserace.tscn")
