extends Node2D

@onready var child = get_children()[0]
var max_dist = 10

func _process(delta):
	look_at(get_global_mouse_position())
	var mouse_pos = get_local_mouse_position()
	var dir = Vector2.ZERO.direction_to(mouse_pos)
	var dist = mouse_pos.length()
	child.position = dir * min(dist, max_dist)
	
