extends Area2D



export var speed = 200  # How fast the player will move (pixels/sec).
export (float) var max_health = 100

var screen_size  # Size of the game window.

var health = 4 setget set_health

func _ready():
	Global.player = self
	screen_size = get_viewport_rect().size
	set_process(true)
	add_to_group("Player")
	pass

func set_health(new_value):
	health = new_value
	if health <= 0: queue_free()
	pass



func _process(delta):

	var velocity = Vector2()  # The player's movement vector.

	if Input.is_action_pressed("ui_right"):

		velocity.x += 1

	if Input.is_action_pressed("ui_left"):

		velocity.x -= 1

	if Input.is_action_pressed("ui_down"):

		velocity.y += 1

	if Input.is_action_pressed("ui_up"):

		velocity.y -= 1

	if velocity.length() > 0:

		velocity = velocity.normalized() * speed

		$AnimatedSprite.play()

	else:

		$AnimatedSprite.stop()

	position += velocity * delta

	position.x = clamp(position.x, 0, screen_size.x)

	position.y = clamp(position.y, 0, screen_size.y)

	if velocity.x != 0 and velocity.y == 0:

		$AnimatedSprite.animation = "Run"			

		#$AnimatedSprite.flip_v = false

		$AnimatedSprite.flip_h = velocity.x < 0      

	elif velocity.x != 0 and velocity.y < 0:

		$AnimatedSprite.animation = "Run"

		$AnimatedSprite.flip_h = velocity.x < 0

	elif velocity.x != 0 and velocity.y > 0:

		$AnimatedSprite.animation = "Run"

		$AnimatedSprite.flip_h = velocity.x < 0	

	elif velocity.y < 0:

		$AnimatedSprite.animation = "Run"

	

	elif velocity.y > 0:

		$AnimatedSprite.animation = "Run"
		
	if Input.is_action_just_pressed("ui_select"):
		shoot()
		
func shoot():
	var projectile = load("res://Samir's Things/Projectile.tscn")
	var bullet = projectile.instance()
	add_child_below_node(get_tree().get_root().get_node("Game"), bullet)
