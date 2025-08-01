extends Node2D

@onready var car: CharacterBody2D = $Car

func _on_finish_line_body_entered(body: Node2D) -> void:
	print(body, "Entered, change loop!")
	car.modulate = Color.YELLOW_GREEN
