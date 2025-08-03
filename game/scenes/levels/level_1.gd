class_name Level1 extends BaseLevel



@export var loops_to_win := 2

func _ready() -> void: #overridden
	FinishLine.I.crossed.connect(line_crossed)
	change_color() # To reset all collisions initially

func line_crossed():
	BaseCar.I.reset_car_pos()
	change_color()
	
	loops_to_win -= 1
	if loops_to_win == 0:
		level_completed()
	

func level_completed():
	#show_completion_popup() #TODO
	var time_slow_tween := create_tween().set_trans(Tween.TRANS_CUBIC).set_ignore_time_scale()
	time_slow_tween.tween_property(Engine, "time_scale", 0.7, 0.3)
	#time_slow_tween.tween_property()
	print("level_over");# LevelManager.I.advance_to_next_level()


func change_color():
	var color_type := color_order[FinishLine.I.body_entered_count % color_order.size()]
	for tilemap in tilemaps:
		if tilemap.type == color_type:
			tilemap.collision_enabled = true
			tilemap.visible = true
			continue
		
		tilemap.collision_enabled = false
		tilemap.visible = false
	
	BaseCar.I.modulate = Color("Dark"+Utils.get_color_key_as_string(color_type))
	BaseCar.I.modulate.h = 0.5
