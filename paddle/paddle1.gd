extends RigidBody2D

var speed = 350  # Adjust as needed
var angle = 5  # Angle in degrees

func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_right_1"):
		velocity.x += 1
		rotation_degrees = angle
	elif Input.is_action_pressed("ui_left_1"):
		velocity.x -= 1
		rotation_degrees = -angle
	else:
		rotation_degrees = 0
		
	velocity = velocity.normalized() * speed
	linear_velocity = velocity
