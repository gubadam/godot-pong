extends Label

var score1 = 0
var score2 = 0
signal test

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(score1) + " | " + str(score2)

func _on_p1_score():
	score1 += 1

func _on_p2_score():
	score2 += 1

func _on_area_2d_body_entered(body):
	if (body.name == "Ball"):
		_on_p2_score()
		test.emit()

func _on_area_2d_2_body_entered(body):
	if (body.name == "Ball"):
		_on_p1_score()
		test.emit()
