class_name Car extends RigidBody2D

static var I:Car

func _init() -> void:
	I = self

@export var rotation_speed: float = 5
@export var power : float = 7000

var target_rot : float
var input_dir : Vector2 = Vector2.ZERO
var last_dir : Vector2 = Vector2.RIGHT

@onready var initial_position = global_position
@onready var car_handler: PlayerInputComponent = %CarHandler


func _ready() -> void:
	car_handler.direction_changed.connect(func(dir): input_dir = dir)


func _process(_delta: float) -> void:
	apply_central_force(transform.x * power * -input_dir.y)


func _integrate_forces(state: PhysicsDirectBodyState2D) -> void :
	rotation += input_dir.x * rotation_speed * state.step



func reset_car():
	global_position = initial_position
