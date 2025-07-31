extends Node

@export var acceleration := 2.0
@export var turn_speed := 5.0

@onready var body: CharacterBody2D = get_parent()


func _physics_process(delta):
	var input = Input.get_vector("move_left", "move_right", "move_down", "move_up")
	
	body.rotation += input.x * turn_speed * delta * input.y
	body.velocity += body.transform.x * acceleration * input.y
	
	body.move_and_slide()
