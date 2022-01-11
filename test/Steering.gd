extends Node


const DEFAULT_MASS: = 2.0
const  DEFAULT_MAX_SPEED: = 400.0
const DEFAULT_SLOW_RADIUS: = 400.0


static func follow(
		velocity: Vector2,
		global_position: Vector2,
		target_position: Vector2,
		max_speed: = DEFAULT_MAX_SPEED,
		mass: = DEFAULT_MASS
) -> Vector2:
	var to_target: = global_position.distance_to(target_position)
	var desired_velocity: = (target_position - global_position).normalized() * max_speed
	if to_target < DEFAULT_SLOW_RADIUS:
		desired_velocity *= (to_target / DEFAULT_SLOW_RADIUS)* 0.8 + 0.2
	var steering: = (desired_velocity - velocity) / mass
	return velocity + steering
