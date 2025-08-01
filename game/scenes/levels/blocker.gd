class_name Blocker extends StaticBody2D

@onready var collision_shape_2d = $CollisionShape2D

func _notification(what: int) -> void:
	match what:
		NOTIFICATION_VISIBILITY_CHANGED:
			if visible:
				if collision_shape_2d != null:
					collision_shape_2d.set_deferred("disabled", true)
			else:
				if collision_shape_2d != null:
					collision_shape_2d.set_deferred("disabled", false)
