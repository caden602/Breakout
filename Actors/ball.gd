extends CharacterBody2D

@export var speed: float = 3.0
@export var max_speed: float = 10.0
var forward = Vector2(1,1).normalized()

func _physics_process(delta: float) -> void:
    var collision: KinematicCollision2D = move_and_collide(forward * speed)
    if (collision):
        forward = forward.bounce(collision.get_normal())
        speed = clamp(speed + 0.5, 1, max_speed)
        
        if (collision.get_collider().is_in_group("Bricks")):
            collision.get_collider().queue_free()
