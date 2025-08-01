class_name BaseLevel extends Node2D

func _ready() -> void:
	FinishLine.I.crossed.connect(func(_b): print_tree())
