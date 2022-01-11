extends Area2D

var speed = 100
var path : = PoolVector2Array() setget set_path
var destination = Vector2()

func _ready():
	pass

func _physics_process(delta):
	if path.size() > 0:
# move along the path if the mob hasn't reached the destination
		var distance = speed * delta
		move_along_path(distance)
	elif abs(position.x - destination.x) < 10 and abs(position.y - destination.y) < 10.0:
# free the mob when it reaches destination
		queue_free()
	
func move_along_path(distance):
	var start_pos = position

# while there is still a path
	for i in range(path.size()):
# move to next position on the path
		var distance_to_next = start_pos.distance_to(path[0])
		if distance <= distance_to_next and distance > 0:
			position = start_pos.linear_interpolate(path[0], distance_to_next)
			break
		elif distance <= 0:
			position = path[0]
			break

		distance -= distance_to_next
		start_pos = path[0]
		path.remove(0)

func set_path(new_path):
	# the path is set in the main script
	path = new_path
