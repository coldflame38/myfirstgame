extends CharacterBody2D


@export var health = 10
@export var movement_speed = 10.0
@export var knockbackRecovery = 3.5
var knockback = Vector2.ZERO

@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, knockbackRecovery)
	var direction = global_position.direction_to(player.global_position)
	
	velocity = direction*movement_speed
	velocity += knockback
	move_and_slide()
	

func _on_hurtbox_hurt(damage, angle, knockback_amount):
	health -= damage
	knockback = angle * knockback_amount
	print(health)
	if health <= 0:
		queue_free()
