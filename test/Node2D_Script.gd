extends Node2D

var enemy = preload("res://Samir's Things/EnemyGoblin.tscn")

func _ready():
	randomize()

func _on_respawnTimer_timeout():
	var yLoc = rand_range(0, -1000)
	var xLoc = rand_range(3000, 5000)
	var e = enemy.instance()
	add_child(e)
	e.position = Vector2(xLoc, yLoc)
	$respawnTimer.wait_time = max(.01, $respawnTimer.wait_time - .01)



func _on_leveltimer_timeout():
	get_tree().change_scene("res://Level2.tscn")
