extends TextureButton

func _on_MainMenuButton_button_up():
	get_tree().change_scene("res://Scenes/TitleScreen.tscn")
