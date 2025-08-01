extends Area2D

@export var connected_blocker : StaticBody2D

func _ready() -> void:
	body_entered.connect(free_blocker_and_self.unbind(1))


func free_blocker_and_self():
	connected_blocker.queue_free()
	queue_free()
