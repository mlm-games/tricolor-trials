class_name TimeLabel extends RichTextLabel

var time_start : int = 0
var is_timing : bool = false

func _ready() -> void:
	PlayerCarHandler.I.initial_input_recieved.connect(start_timer_and_play_anim)
	#pivot_offset = size / 2

func start_timer_and_play_anim():
	var tween := create_tween().set_trans(Tween.TRANS_CUBIC).parallel()
	tween.tween_property(self, "modulate", Color.LIGHT_GOLDENROD, 0.3)
	tween.tween_property(self, "scale", Vector2.ONE * 1.1, 0.3)
	time_start = Time.get_ticks_msec()
	is_timing = true

func _process(_delta):
	if is_timing:
		var elapsed_ms := Time.get_ticks_msec() - time_start
		
		text = Utils.format_time_in_min_sec_ms(elapsed_ms)
		
