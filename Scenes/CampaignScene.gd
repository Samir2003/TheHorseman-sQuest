extends CanvasLayer

func _ready():
	yield(get_tree().create_timer(12), "timeout")
	get_tree().change_scene("res://Level1.tscn")
