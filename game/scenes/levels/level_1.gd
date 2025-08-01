class_name Level1 extends BaseLevel

func _ready() -> void:
	FinishLine.I.crossed.connect(line_crossed)

func line_crossed():
	Car.I.reset_car()
	change_color()

func change_color():
	var color_type := color_order[FinishLine.I.body_entered_count]
	for tilemap in tilemaps:
		if tilemap.type == color_type:
			tilemap.collision_enabled = true
			tilemap.visible = true
			return
		
		tilemap.collision_enabled = false
		tilemap.visible = false
