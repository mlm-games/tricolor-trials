extends CanvasLayer

signal screen_covered

const SHADER = preload("uid://cxnlsq7fn1k7y")

@onready var transition_player: AnimationPlayer = $TransitionRect/TransitionPlayer
@onready var transition_rect : ColorRect = $TransitionRect
@onready var white_rect : ColorRect = $OnScreenEffectsRect
@onready var effects_player: AnimationPlayer = $OnScreenEffectsRect/EffectsPlayer
@onready var shader_rect: ColorRect = $ShaderRect

var single_transition : bool

enum TransitionNames {
	wipeToColor,
	wipeToNormal,
	fadeToBlack,
	slightFlash,
	fadeToNormal
}

static func get_enum_key_name(key: TransitionNames) -> StringName:
	return TransitionNames.keys()[key]

func _ready() -> void:
	transition_rect.visible = false
	white_rect.visible = false
	shader_rect.visible = false

func change_scene_with_transition(scene_path: String, anim_key: TransitionNames = TransitionNames.fadeToBlack, pop_up: bool = false) -> void:
	transition(anim_key)
	await screen_covered
	if !pop_up:
			A.tree.change_scene_to_file(scene_path)

func change_scene_with_transition_packed(scene: PackedScene, anim_key: TransitionNames = TransitionNames.fadeToBlack) -> void:
	transition(anim_key)
	await screen_covered
	A.tree.change_scene_to_packed(scene)
	

func transition(anim_key: TransitionNames = TransitionNames.fadeToBlack, single_transition_only: bool = false, speed_scale: float = 1, pop_up: bool = false) -> void:
	if single_transition_only:
			single_transition = true
	var anim_name := get_enum_key_name(anim_key)
	match anim_name:
			"fadeToBlack":
					transition_player.speed_scale = speed_scale
					transition_rect.material = ShaderMaterial.new()
					transition_rect.visible = true
					transition_player.play(anim_name)
			"slightFlash":
					transition_player.speed_scale = speed_scale
					white_rect.visible = true
					transition_player.play(anim_name)
			"wipeToColor":
					transition_player.speed_scale = speed_scale
					#transition_rect.material.shader = SHADER
					transition_rect.modulate = Color.WHITE
					transition_rect.visible = true
					transition_player.play(anim_name)
			"wipeToNormal":
					transition_player.speed_scale = speed_scale
					#transition_rect.material.shader = SHADER
					transition_rect.visible = true
					transition_rect.modulate = Color.WHITE
					transition_player.play(anim_name)
	if pop_up:
			pass



func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if !single_transition:
		match anim_name:
				"fadeToBlack":
						screen_covered.emit()
						transition_player.play("fadeToNormal")
				"fadeToNormal":
						transition_rect.hide()
				"slightFlash":
						white_rect.hide()
				"wipeToColor":
						screen_covered.emit()
						transition_player.play("wipeToNormal")
				"wipeToNormal":
						transition_rect.hide()
	single_transition = false

func _input(_event: InputEvent) -> void:
	if transition_player.is_playing():
			get_viewport().set_input_as_handled()
