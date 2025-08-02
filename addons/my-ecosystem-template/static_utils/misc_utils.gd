class_name Utils extends Node

static func get_color_key_as_string(key: LevelTileMap.LevelType) -> StringName:
	return LevelTileMap.LevelType.keys()[key].capitalize()
