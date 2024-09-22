extends Area2D

@onready var sprite = $hand
@onready var collide = $handcollide

var max_dist = 8
var level = 1
@export var damage = 5
var knockback_amount = 4


func _process(delta):
	look_at(get_global_mouse_position())
	var mouse_pos = get_local_mouse_position()
	var dir = Vector2.ZERO.direction_to(mouse_pos)
	var dist = mouse_pos.length()
	sprite.position = dir * min(dist, max_dist)
	collide.position = dir * min(dist, max_dist)
  
func get_damage():
	return damage

func _on_hand_hit_area_entered(area):
	print("Area", damage)


func _on_hand_hit_body_entered(body):
	print("Body", damage)
