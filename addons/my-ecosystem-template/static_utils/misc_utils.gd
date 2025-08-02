class_name Utils extends Node

static func get_color_key_as_string(key: LevelTileMap.LevelType) -> StringName:
	return LevelTileMap.LevelType.keys()[key].capitalize()


static func format_time_in_min_sec_ms(t: int):
	var minutes := int(t / 60000)
	var seconds := int((t / 1000) % 60)
	var millis = int(t % 1000)
	
	# Format as mm:ss:000
	return "%02d:%02d:%03d" % [minutes, seconds, millis]
