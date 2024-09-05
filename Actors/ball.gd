extends CharacterBody2D

@export var speed: float = 300.0
@export var max_speed: float = 1000.0
@export var tile_map: TileMap



var forward = Vector2(1,1).normalized()
const PADDLE_WIDTH: float = 100.0
var current_score: int = 0

func _physics_process(delta: float) -> void:
	if (not tile_map.game_running):
		return

	var collision: KinematicCollision2D = move_and_collide(forward * speed * delta)
	if (collision):
		forward = forward.bounce(collision.get_normal())
		speed = clamp(speed + 0.5, 1, max_speed)
		
		if (collision.get_collider().is_in_group("Bricks")):
			tile_map.delete_board_piece()
			# collision.get_collider().color_change(self)
			# current_score += 10
			# score_label.text = "SCORE: " + str(current_score)

		if (collision.get_collider().is_in_group("Paddle")):
			var paddle_x = collision.get_collider().position.x - PADDLE_WIDTH / 2
			var pos_on_paddle = (position.x - paddle_x) / PADDLE_WIDTH
			var bounce_angle = lerp(-PI * 0.8, -PI * 0.2, pos_on_paddle)
			forward = Vector2.from_angle(bounce_angle)

		if (collision.get_collider().is_in_group("Game_Over")):
			tile_map.game_over_screen()