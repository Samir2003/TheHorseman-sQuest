extends Actor

var health = 4

func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	
	if $RayCast2D.is_colliding():
		var player = get_parent().get_parent().get_node("/root/Level/Player/Horseman")
		player.health -= 1
		player.TakeDamage()
		queue_free()
	if $RayCast2D2.is_colliding():
		var player = get_parent().get_parent().get_node("/root/Level/Player/Horseman")
		player.health -= 1
		player.TakeDamage()
		queue_free()
		
	velocity.y += gravity * delta
	if is_on_wall():
		velocity.x *= -1.0
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y
	
	
func TakeDamage():
		if (health == 1):
			queue_free()
