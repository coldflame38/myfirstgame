extends CharacterBody2D

var movespeed = 50.0
const accel = 10.0
@onready var sprite = $Sprite2d
@onready var walkTimer = get_node("%walkTimer")
@onready var idleTimer = get_node("%idleTimer")


func _physics_process(delta):
	var playerInput = movement()
	if Input.is_action_pressed("run"):
		movespeed = 100.0
		$AnimationPlayer.speed_scale = 2.0
	else:
		movespeed = 50.0
		$AnimationPlayer.speed_scale = 1.0
	
	velocity = lerp(velocity, playerInput * movespeed, delta * accel)
	move_and_slide()

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
		
	return mov.normalized()


