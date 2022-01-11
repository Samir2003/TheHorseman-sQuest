extends KinematicBody2D
onready var player = get_node("/root/Level/Player/Horseman")
var speed = 10000
var motion = Vector2()

func _ready():
	player = Global.player


func follow(deltaTime): 
		var MoveVector = (player.position - position) 
		var Velocity = speed * deltaTime 
		motion = MoveVector * Velocity 
		move_and_slide(motion)


func _process(delta):
	follow(delta)
