extends Area2D

func _ready() -> void:
	body_entered.connect(func(_b): BaseCar.I.reset_car_pos())
