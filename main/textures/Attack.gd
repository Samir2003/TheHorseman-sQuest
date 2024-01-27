extends Node

var attack_cooldown_time = 1000
var next_attack_time = 0
var attack_damage = 30

	if event.is_action_pressed("attack"):
	# Check if player can attack
	var now = OS.get_ticks_msec()
	if now >= next_attack_time:
		# Play attack animation
		attack_playing = true
		var animation = get_animation_direction(last_direction) + "_attack"
		$Sprite.play(animation)
		# Add cooldown time to current time
		next_attack_time = now + attack_cooldown_time
