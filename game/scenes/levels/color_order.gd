extends RichTextLabel

func _ready() -> void:
	set_color_order_text()

func set_color_order_text():
	text = "Color order: \n"
	for color_key in BaseLevel.I.color_order:
		text += "[color=Light%s]%s[/color]" % [Utils.get_color_key_as_string(color_key), Utils.get_color_key_as_string(color_key)]
		text += " -> "
	text += "End!"
