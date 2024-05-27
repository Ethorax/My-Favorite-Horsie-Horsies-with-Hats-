@tool
extends CharacterBody3D

@onready var frik = $Armature/Skeleton3D/FRIK
@onready var flik = $Armature/Skeleton3D/FLIK
@onready var brik = $Armature/Skeleton3D/BRIK
@onready var blik = $Armature/Skeleton3D/BLIK

@onready var new_fr_target = $Armature/FRNewTarget
@onready var new_fl_target = $Armature/FLNewTarget
@onready var new_br_target = $Armature/BRNewTarget
@onready var new_bl_target = $Armature/BLNewTarget

@onready var fr_target = $TargetHolder/FRTarget
@onready var fl_target = $TargetHolder/FLTarget
@onready var br_target = $TargetHolder/BRTarget
@onready var bl_target = $TargetHolder/BLTarget

var fr_current

@export var leg_length = 10.0
@export var SPEED := 10.0
@export var step_height : float = 5

var is_stepping = false

# Called when the node enters the scene tree for the first time.
func _ready():
	frik.start()
	flik.start()
	brik.start()
	blik.start()
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

	
	if(fr_target.global_position.distance_to(new_fr_target.global_position) ==0):
		is_stepping = false
		
		print(is_stepping)
	elif(fr_target.global_position.distance_to(new_fr_target.global_position) > 10):
		is_stepping = true
		print(is_stepping)
	if is_stepping:
		fr_target.global_position.x = move_toward(fr_target.global_position.x,new_fr_target.global_position.x,1)
		fr_target.global_position.z = move_toward(fr_target.global_position.z,new_fr_target.global_position.z,1)
		fr_current = fr_target
		
	if((!is_stepping or fl_target.global_position.distance_to(new_fl_target.global_position) < 10) and fl_target.global_position.distance_to(new_fl_target.global_position) ==0):
		is_stepping = false
		print(is_stepping)
	elif(fl_target.global_position.distance_to(new_fl_target.global_position) > 10):
		is_stepping = true
		print(is_stepping)
	if is_stepping:
		fl_target.global_position.x = move_toward(fl_target.global_position.x,new_fl_target.global_position.x,1)
		fl_target.global_position.z = move_toward(fl_target.global_position.z,new_fl_target.global_position.z,1)
		#fl_current = fl_target	
		
	if((!is_stepping or br_target.global_position.distance_to(new_br_target.global_position) < 10) and br_target.global_position.distance_to(new_br_target.global_position) ==0):
		is_stepping = false
		print(is_stepping)
	elif(br_target.global_position.distance_to(new_fr_target.global_position) > 10):
		is_stepping = true
		print(is_stepping)
	if is_stepping:
		br_target.global_position.x = move_toward(br_target.global_position.x,new_br_target.global_position.x,1)
		br_target.global_position.z = move_toward(br_target.global_position.z,new_br_target.global_position.z,1)
		#br_current = fr_target	
		
	if((!is_stepping or bl_target.global_position.distance_to(new_bl_target.global_position) < 10) and bl_target.global_position.distance_to(new_bl_target.global_position) ==0):
		is_stepping = false
		print(is_stepping)
	elif(bl_target.global_position.distance_to(new_bl_target.global_position) > 10):
		is_stepping = true
		print(is_stepping)
	if is_stepping:
		bl_target.global_position.x = move_toward(fr_target.global_position.x,new_bl_target.global_position.x,1)
		bl_target.global_position.z = move_toward(bl_target.global_position.z,new_bl_target.global_position.z,1)
		fr_current = fr_target

