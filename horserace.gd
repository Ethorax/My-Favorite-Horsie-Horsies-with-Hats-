extends Node3D

var left : bool = true
var right : bool = false
@onready var path_follow_3d = $Path3D/PathFollow3D

@onready var top_speed = 2.0
@onready var accel = 0.5
@onready var deaccel = 0.05
var speed = 0


var lap = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	if(Global.head_wear!=""):
		
		var hat = load(Global.head_wear).instantiate()
		hat.scale = Vector3(0.2,0.2,0.2)
		$Path3D/PathFollow3D/RaceHorse/head.add_child(hat)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(Input.is_action_just_pressed("ui_left")):
		if(left):
			#path_follow_3d.progress += 1.0
			speed += accel
			left = false
			right = true
	elif(Input.is_action_just_pressed("ui_right")):
		if(right):
			#path_follow_3d.progress += 1.0
			speed += accel
			right = false
			left = true
	if(speed>0):
		$AnimationPlayer.play("run",speed)
	path_follow_3d.progress += speed
	speed = move_toward(speed,0,deaccel)


func _on_node_3d_body_entered(body):
	lap += 1
	$Container/RichTextLabel.text = "[center]" + str(lap) + "/5"
	if(lap > 5):
		
		if($Container/RaceTimer.seconds < 5):
			Global.money += 90
		elif $Container/RaceTimer.seconds < 10:
			Global.money += 60
		else:
			Global.money += 30
		
		print("You win")
		get_tree().change_scene_to_file("res://room.tscn")
