extends KinematicBody2D 
var dir = Vector2()
const SPEED = 550
export var health = 3
onready var player = get_node("/root/Level/Player/Horseman")
onready var enemy2d = get_node("/root/Level/EnemySkeleton")
onready var enemy = get_node("/root/Level/Skeleton/EnemySkeleton1")
func _ready():
	player = Global.player
	enemy = Global.enemy
func _physics_process(delta):
		var dir = (player.global_position - global_position).normalized()
		if dir.x < 1:
				move_and_collide(dir * SPEED * delta)
				$AnimatedSkeleton.flip_h = dir.x > 0 
		else:
				move_and_collide(dir * SPEED * delta)
		if $RayCast2D1.is_colliding() or $RayCast2D2.is_colliding() or $RayCast2D3.is_colliding() or $RayCast2D4.is_colliding():
			if $RayCast2D1.get_collider() == get_node("/root/Level/Player/Horseman") or $RayCast2D2.get_collider() == get_node("/root/Level/Player/Horseman") or $RayCast2D3.get_collider() == get_node("/root/Level/Player/Horseman") or $RayCast2D4.get_collider() == get_node("/root/Level/Player/Horseman"):
				player.health -= 1
				player.TakeDamage()
				queue_free()
			
func TakeDamage():
		if (health == 1):
			get_tree().get_root().get_node("/root/Level").enemy_defeat()
			$AnimatedSkeleton.animation = "Death"
			yield(get_tree().create_timer(0.75), "timeout")
			queue_free()
			
