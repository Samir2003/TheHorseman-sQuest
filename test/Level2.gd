extends Node2D
var enemy = preload("res://Samir's Things/EnemyShrek.tscn")
var enemy1 = preload("res://Samir's Things/EnemyMiniGoblin.tscn")
var enemycount = 0
func _ready():
	randomize()
	
func _on_respawnTimer_timeout():
	var yLoc = rand_range(-1536, -1715)
	var xLoc = rand_range(6400, 6784)
	var yLoc1 = rand_range(-4080, -4700)
	var xLoc1 = rand_range(5000, 9600)
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
	if enemycount >= 30:
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Level3.tscn")
