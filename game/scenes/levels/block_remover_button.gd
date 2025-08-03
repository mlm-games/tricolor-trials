extends Area2D

@export var connected_blocker : StaticBody2D

func _ready() -> void:
	body_entered.connect(free_blocker_and_self.unbind(1))


func free_blocker_and_self():
	UiAudioM._play_ui_sound(preload("uid://b2ipqc1uja1ih"))
	var tween = ScreenEffects.flash_white(connected_blocker, 0.1)
	tween.parallel().tween_property(connected_blocker, "scale", Vector2.ZERO, 0.15).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(connected_blocker.queue_free)
	queue_free()
