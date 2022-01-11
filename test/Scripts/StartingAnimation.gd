extends CanvasLayer


func _on_Fade_ready():
	$AnimationTrigger.play("FadeIn")
	yield($AnimationTrigger, "animation_finished")
	$AnimationTrigger.play_backwards("FadeIn")
	yield($AnimationTrigger, "animation_finished")
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
