extends Area2D
var vel = Vector2() # Defining the movement of the arrow. 
export var speed1 = 350
func _ready():
	vel.x = -350 # Setting the speed of the arrow
	vel.y = -0.1   # Setting the arrow's gravity
	pass

func _physics_process(delta):
	if $RayCast2D.is_colliding():
			var enemy = $RayCast2D.get_collider()
			enemy.name.find("EnemyGoblin")
			enemy.health -= 1
			enemy.TakeDamage()
			queue_free()
	translate(vel * delta)  # Arrow's movement functionality




func _on_KinematicBody2D_body_entered(body):
	queue_free()


func _on_Timer_timeout():
	queue_free()
