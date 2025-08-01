class_name FinishLine extends Area2D

static var I: FinishLine

signal crossed

func _init() -> void:
	I = self

func  _ready() -> void:
	body_entered.connect(crossed.emit)
