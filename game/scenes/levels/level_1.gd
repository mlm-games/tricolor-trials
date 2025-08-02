class_name Level1 extends BaseLevel



@export var loops_to_win := 2

func _ready() -> void:
	FinishLine.I.crossed.connect(line_crossed)
	change_color() # To reset all collisions initially

func line_crossed():
	if loops_to_win == 0:
		print("level_over")
	
	loops_to_win -= 1
	BaseCar.I.reset_car_pos()
	change_color()

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
