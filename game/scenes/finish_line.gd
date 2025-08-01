class_name FinishLine extends Area2D

static var I: FinishLine

signal crossed

var body_entered_count := 0

func _init() -> void:
	I = self

func  _ready() -> void:
	body_entered.connect(_on_body_crossed) #Only masks for cars

func _on_body_crossed(_body):
	body_entered_count += 1
	crossed.emit()
