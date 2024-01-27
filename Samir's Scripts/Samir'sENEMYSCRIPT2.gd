extends KinematicBody2D


var speed = 150

func _ready():
	set_fixed_process(true)


func _fixed_process(delta):

	var Move = Vector2()
	var body = get_node("body").get_overlapping_bodies()
	
	if(body.size() !=0 ):
		for tinge in body:
			if(tinge.is_in_group("player")):
				if(tinge.get_global_pos().x < self.get_global_pos().x):
					Move += Vector2(-1,0)
				if(tinge.get_global_pos().x > self.get_global_pos().x):
					Move += Vector2(1,0)
				if(tinge.get_global_pos().y < self.get_global_pos().y):
					Move += Vector2(0,-1)
				if(tinge.get_global_pos().y > self.get_global_pos().y):
					Move += Vector2(0,1)

	Move = Move.normalized() * speed * delta
	Move = move(Move)
	
