extends TextureButton



func _on_CampaignModeButton_button_up():
	get_tree().change_scene("res://Scenes/CampaignScene.tscn")
	yield(get_tree().create_timer(12), "timeout")
	get_tree().change_scene("res://Scenes/Level1.tscn")
