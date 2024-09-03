extends CharacterBody2D

var brick_grey = load("res://Assets/Brick_Grey.png")
var brick_red = load("res://Assets/Brick_Red.png")

func color_change(ball: CharacterBody2D):
	var ball_color = $Sprite2D.modulate
	if (ball_color == Color(1,1,1)):
		$Sprite2D.texture = brick_red
	# print($Sprite2D.name)
	pass
