extends CharacterBody2D

var movespeed = 100.0
var lastMovement = Vector2.UP
@onready var sprite = $Sprite2d
@onready var walkTimer = get_node("%walkTimer")
@onready var idleTimer = get_node("%idleTimer")


func _physics_process(delta):
	movement()

func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov,y_mov)
	if mov.x > 0:
		sprite.flip_h = false
	elif mov.x < 0 :
		sprite.flip_h = true
	
	if mov != Vector2.ZERO:
		if $AnimationPlayer.get_current_animation() != "walk":
			$AnimationPlayer.stop()
			$AnimationPlayer.play("walk")
	else:
		if $AnimationPlayer.get_current_animation() != "idle":
			$AnimationPlayer.stop()
			$AnimationPlayer.play("idle")
		
	velocity = mov.normalized()*movespeed
	move_and_slide()
