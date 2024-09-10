extends CharacterBody2D

func _physics_process(delta: float) -> void:
	if (position.x >= 70):
		position.x = 70
	if (position.x >= 314):
		position.x = 314
	else:
		position.x = get_viewport().get_mouse_position().x
