extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var s_timer = $StationTimer
@onready var w_timer = $WalkTimer

var current_head = ""
var current_face = ""
var current_foot = ""
@onready var body = $Body


var rng = RandomNumberGenerator.new()

var direction_point
var direction
var food_target 

var walking : bool = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _ready():
	s_timer.start()
	

func _physics_process(delta):
	
	if(current_head != Global.head_wear):
		for cloth in body.get_child(0).get_children():
			cloth.queue_free()
		current_head = Global.head_wear
		var clothing = load(current_head).instantiate()
		body.get_child(0).add_child(clothing)
	
	
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	
	if(walking):
		if(Global.pony_hunger<100 and food_target !=null):
			look_at(Vector3(food_target.position.x,0,food_target.position.z))
			direction = global_position.direction_to(Vector3(food_target.position.x,0,food_target.position.z))
		else:
			look_at(direction_point)
			direction = global_position.direction_to(direction_point)
		velocity = direction * SPEED
		
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if(Global.pony_hunger<100 and food_target !=null):
		look_at(food_target.position)

	move_and_slide()


func _on_walk_timer_timeout():
	if(!Global.pony_hunger<100 or Global.foods.is_empty()):
		s_timer.start()
	walking = false

func _on_station_timer_timeout():
	w_timer.start()
	walking = true
	direction_point = Vector3(randi_range(-50,50),0,randi_range(-50,50))
	if(Global.pony_hunger<100 and !Global.foods.is_empty()):
		clean_up_food()
		var closest = Global.foods[0]
		for hay in Global.foods:
			if hay!=null:
				if(position.distance_to(hay.position)>= position.distance_to(closest.position)):
					food_target = closest
			
			
func clean_up_food():
	var array = Global.foods as Array
	var pop_array = []
	for i in array.size()-1:
		print(i)
		if(!is_instance_valid(array[i])):
			pop_array.append(i)
			
	for i in pop_array:
		array.pop_at(i)
	food_target = null
	pop_array = []
	Global.foods = array
