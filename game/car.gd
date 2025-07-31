class_name Car extends RigidBody2D

@export var rotation_speed: float = 1
@export var power : float = 5000

var target_rot : float
var input_dir : Vector2 = Vector2.ZERO
@onready var car_handler: PlayerInputComponent = %CarHandler

var last_dir : Vector2 = Vector2.RIGHT

func _ready() -> void:
	car_handler.direction_changed.connect(func(dir): input_dir = dir)


func _process(_delta: float) -> void:
	apply_central_force(transform.x * power * -input_dir.y)



func _integrate_forces(state: PhysicsDirectBodyState2D) -> void :
	rotation = lerp_angle(rotation, rotation + Vector2(input_dir.x,0).angle(), rotation_speed * state.step)
