extends KinematicBody2D

var velocity = Vector2()


func _ready():
	velocity.x = 800
	
func _physics_process(_delta):
	
	if $RayCast2D.is_colliding():
		var player = get_parent().get_parent().get_node("Enemies/Enemy")
		player.health -= 1
		player.TakeDamage()
		queue_free()
		
	if position.x > 500:
		queue_free()
	move_and_slide(velocity)
