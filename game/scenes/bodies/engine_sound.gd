extends AudioStreamPlayer2D

var pitch_range: Vector2 = Vector2(0.2, 0.4)

func _physics_process(delta: float) -> void:
	pitch_scale = clampf(BaseCar.I.velocity.length() * delta * 0.1, pitch_range.x, pitch_range.y)
	#print(pitch_scale)
