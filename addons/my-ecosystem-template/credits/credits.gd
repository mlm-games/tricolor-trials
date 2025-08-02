extends Control

func _ready() -> void:
	%ExitButton.pressed.connect(STransitions.change_scene_with_transition.bind(C.PATHS.MENU_SCENE))
	$PopupAnimator.animate_in()
	%ExitButton.grab_focus()
