class_name Blocker extends StaticBody2D

@onready var collision_shape_2d = $CollisionShape2D

#func _ready() -> void:
	
	#visibility_changed.connect(collision_shape_2d.set_deferred.bind("disabled", is_visible_in_tree()))
	#visibility_changed.connect(func(): await get_tree().process_frame; print(collision_shape_2d.disabled))
##
func _notification(what: int) -> void:
	match what:
		NOTIFICATION_VISIBILITY_CHANGED:
			if collision_shape_2d: collision_shape_2d.set_deferred("disabled", !is_visible_in_tree())
			## The same as below
			#if is_visible_in_tree(): # visible won't work for parent based hiding
				#if collision_shape_2d != null:
					#collision_shape_2d.set_deferred("disabled", false)
			#else:
				#if collision_shape_2d != null:
					#collision_shape_2d.set_deferred("disabled", true)
