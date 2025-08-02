class_name BaseCar extends CharacterBody2D

static var I : BaseCar

func _init() -> void:
	I = self

@export var friction := 10.0 # Physics material friction is not for top down games
@export var boost_impulse := 1000.0
@export var wheelbase := 20.0
@export var max_steer := 0.5  # radians
@export var engine_power := 800.0
@export var max_speed := 500.0

var steer_angle := 0.0
var is_boost_charged := false
var autopilot := false
var is_boosting := false
var target_rot : float
var last_dir : Vector2 = Vector2.RIGHT


@onready var initial_position = global_position
@onready var car_handler: PlayerCarHandler = %CarHandler


func _ready() -> void:
	reset_car_pos()

func play_collision_anim():
	%AnimationPlayer.play("collided")
	

func reset_car_pos():
	global_position = initial_position
