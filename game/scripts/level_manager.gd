class_name LevelManager extends Node

static var I : LevelManager

func _init() -> void:
	I = self

var current_level_index: int = -1



func _start_level(new_level: StringName, with_transition := false):
	if with_transition:
		STransitions.change_scene_with_transition(new_level)
	else:
		A.tree.change_scene_to_file(new_level)

## Called from the menu to start the game from the first level.
func start_game():
	current_level_index = 1
	
	_start_level(C.Levels.Level1, true)
	A.start_gameplay_timer()

## Called from the level scene when the player completes a level.
func advance_to_next_level():
	current_level_index += 1
	
	# Check if there are more levels left.
	if current_level_index < C.Levels.size():
		_start_level(C.Levels["Level" + str(current_level_index)])
	else:
		game_completed()

## Called when the player finishes the final level.
func game_completed():
	print("All levels completed!")
	current_level_index = -1
	STransitions.change_scene_with_transition(C.PATHS.END_SCREEN)

func start_specific_level(index: int):
	if index >= 0 and index < C.Levels.size():
		current_level_index = index
		_start_level(C.Levels["Level" + str(index)] )
