extends Node2D
var enemy = preload("res://Samir's Things/EnemyGoblin.tscn")
var enemycount = 0
func _ready():
	randomize()
	
func _on_respawnTimer_timeout():
	var yLoc = rand_range(1791, 1000)
	var xLoc = rand_range(-179, 10940)
	var e = enemy.instance()
	add_child(e)
	e.position = Vector2(xLoc, yLoc)
	$respawnTimer.wait_time = max(.01, $respawnTimer.wait_time - .01)


func _on_Leveltimer_timeout():
	get_tree().change_scene("res://Level1Endless.tscn")

func enemy_defeat():
	print(enemycount)
	enemycount += 1
	if enemycount >= 20000000:
		yield(get_tree().create_timer(2), "timeout")
		get_tree().change_scene("res://Level2.tscn")
