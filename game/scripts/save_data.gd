class_name SaveData extends SaveManager

static var level_data : Dictionary[StringName, Variant] #Level_name, Time

static var global_data : Dictionary

static func reset():
	global_data = {
		prev_level_index = 1
	}
	level_data = {
		best_time = 0.0, #in ms
		completed = false
	}
	
