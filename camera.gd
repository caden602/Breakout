extends Camera2D

@export var randomStrenght: float = 5.0
@export var shakeFade: float = 5.0
@export var ball: CharacterBody2D

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# Connect the collision signal to a function in this script
	ball.connect("collision_detected", Callable(self, "_on_player_collision"))

func apply_shake():
	shake_strength = randomStrenght

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if shake_strength > 0:
		shake_strength = lerpf(shake_strength,0,shakeFade * delta)
		offset = randomOffset()

func _on_player_collision(collider) -> void:
	if collider.is_in_group("Bricks"):
		apply_shake()

func randomOffset() -> Vector2:
	return Vector2(325 + rng.randf_range(-shake_strength,shake_strength), 352 + rng.randf_range(-shake_strength,shake_strength))
