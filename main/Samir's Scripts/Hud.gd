extends Node


onready var barValue = $"Bar/HP/HealthLevel" 


func barValue_Changed(Value):
	pass
	
	
func _on_Player_HP(HP):
	barvalue.value = HP
	pass
		
