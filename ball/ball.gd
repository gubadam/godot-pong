extends RigidBody2D

var org_x
var org_y
var should_reset = false

# Called when the node enters the scene tree for the first time.
func _ready():
	#org_x = global_position.x
	org_x = randi_range(64, get_viewport_rect().size.x - 64)
	org_y = global_position.y
	global_position.x = org_x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if should_reset:
		print('test')
		call_deferred('reset')

func reset():
	should_reset = false
	freeze = true
	global_position.x = randi_range(64, get_viewport_rect().size.x - 64)
	global_position.y = org_y
	linear_velocity = Vector2.ZERO
	gravity_scale = 0
	await get_tree().create_timer(3).timeout
	gravity_scale = 1
	freeze = false

func _on_score_label_test():
	should_reset = true
	pass # Replace with function body.

func _fixed_process(delta):
	if should_reset:
		print('test')
		reset()
