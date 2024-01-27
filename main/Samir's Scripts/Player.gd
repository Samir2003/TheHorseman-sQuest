extends KinematicBody2D
export var speed = 200   # How fast the player will move (pixels/sec).
var health = 5
var screensize 
func _ready():
	Global.player = self
	set_process(true)
	add_to_group("Player")
	screensize = get_viewport_rect().size
	pass

func _process(delta):
	var velocity = Vector2()  # The player's movement vector.
	if Input.is_action_pressed("ui_right"): # On Movement Right
		velocity.x += 1
	if Input.is_action_pressed("ui_left"): # On Movement Left
		velocity.x -= 1
	if Input.is_action_pressed("ui_down"): # On Movement Down
		velocity.y += 1
	if Input.is_action_pressed("ui_up"): # On Movement Up
		velocity.y -= 1
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, 10000)
	position.y = clamp(position.y, 0,20000)

	velocity = move_and_slide(velocity)

	if velocity.x != 0 and velocity.y == 0:
		$AnimatedSprite.animation = "Run"			
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
	if Input.is_action_just_pressed("ui_select"):# On Click (FIRE!)
		if $AnimatedSprite.flip_h:
			lshoot()
		else:
			rshoot()

func rshoot(): # Firing an arrow to the right
	var projectile = load("res://Samir's Things/ProjectileRight.tscn")
	var bullet = projectile.instance()
	bullet.set_position(position)
	get_parent().add_child(bullet)
	return

func lshoot(): # Firing an arrow to the left
	var projectile = load("res://Samir's Things/ProjectileLeft.tscn")
	var bullet = projectile.instance()
	bullet.set_position(position)
	get_parent().add_child(bullet)
	
func TakeDamage():
	print(health)
	if health <= 0:
		get_tree().change_scene("res://misc.tscn")
			
