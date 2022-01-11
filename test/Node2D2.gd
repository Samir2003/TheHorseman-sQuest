extends Node2D

onready var mob = preload ("res://mob.tscn")

var mobs_reamining = 0

func _ready():
# start the timer
	$mob_spawn_timer.start(1)
	mobs_reamining = 5

func _on_mob_spawn_timer_timeout():
# make an instance of the mob
	var mob_instance = null
	mob_instance = mob.instance()

# set starting position and the destination
	mob_instance.position = $start_position.position
	mob_instance.destination = $end_position.position

#set the path it is going to follow
	var path = $nav.get_simple_path($start_position.position, $end_position.position) # ??? some1 fix
	mob_instance.set_path(path)

# add the mob to the entities container
	$entities.add_child(mob_instance) # why exactly?

	mobs_reamining -= 1
	if mobs_reamining > 0:
		$mob_spawn_timer.start(1)





