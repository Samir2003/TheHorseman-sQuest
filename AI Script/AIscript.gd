extends Actor


func _ready() -> void:
	set_physics_process(false)
	velocity.x = -speed.x


func _physics_process(delta: float) -> void:
	velocity.y += delta
	velocity.y = move_and_slide(velocity, FLOOR_NORMAL).y

func _on_Area2D_body_entered(body):
	queue_free()



