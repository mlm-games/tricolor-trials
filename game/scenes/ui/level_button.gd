@tool
class_name LevelButton extends AnimButton

@export_tool_button("Color") var show_award = color_button.bind(Color.GOLD)


enum AwardTypes {
	Bronze,
	Silver,
	Gold,
	Platinum
}

func color_button(color_key: AwardTypes):
	modulate = Color(get_color_key_as_string(color_key))


static func get_color_key_as_string(key: AwardTypes) -> StringName:
	return AwardTypes.keys()[key].capitalize()
