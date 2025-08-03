class_name EndScreen extends Control

@export var test:= false

func _ready() -> void:
	%PlayButton.grab_focus()
	
	#%SettingsButton.pressed.connect(add_child.bind(preload("uid://dp42fom7cc3n0").instantiate()))
	%CreditsButton.pressed.connect(STransitions.change_scene_with_transition.bind(C.PATHS.CREDITS_SCENE))
	
	%QuitButton.pressed.connect(get_tree().quit)
	
	if test:
		%PlayButton.pressed.connect(STransitions.change_scene_with_transition.bind("uid://babefhxnseam6"))
	else:
		%PlayButton.pressed.connect(LevelManager.I.start_game)
	
