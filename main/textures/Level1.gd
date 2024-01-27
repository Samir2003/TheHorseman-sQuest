extends Node2D
var enemy1 = preload("res://Samir's Things/EnemyAlien.tscn")
var enemy = preload("res://Samir's Things/EnemySkeleton.tscn")
var enemycount = 0
func _ready():
	randomize()
	
func _on_respawnTimer_timeout():
	var yLoc = rand_range(-1536, -1715)
	var xLoc = rand_range(6400, 6784)
	var yLoc1 = rand_range(-1000, 0)
	var xLoc1 = rand_range(1421, 4500)
	var e = enemy.instance()
	var e1 = enemy1.instance()
	add_child(e)
	add_child(e1)
	e.position = Vector2(xLoc, yLoc)
	e1.position = Vector2(xLoc1, yLoc1)
	$respawnTimer.wait_time = max(.01, $respawnTimer.wait_time - .01)

func enemy_defeat():
	print(enemycount)
	enemycount += 1
	if enemycount >= 20:
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Level2.tscn")
