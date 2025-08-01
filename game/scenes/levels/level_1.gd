class_name Level1 extends BaseLevel

@export var loops_to_win := 2

func _ready() -> void:
	FinishLine.I.crossed.connect(line_crossed)

func line_crossed():
	if loops_to_win == 0:
		print("level_over")
	
	loops_to_win -= 1
	Car.I.reset_car()
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
