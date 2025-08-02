class_name PlayerCarHandler extends Node

static var I: PlayerCarHandler

func _init():
	I = self

@onready var player_car : BaseCar = get_parent()

signal initial_input_recieved

func _physics_process(delta):
	player_car.steer_angle = Input.get_axis("move_left", "move_right") * player_car.max_steer
	var throttle := Input.get_axis("accelerate", "brake")
	
	player_car.velocity += player_car.transform.y * throttle * player_car.engine_power * delta
	
	if player_car.velocity.length() > 5:
		var turn_radius := player_car.wheelbase / tan(player_car.steer_angle) if player_car.steer_angle != 0 else 999999.0
		var angular_velocity = player_car.velocity.length() / turn_radius
		player_car.rotation += angular_velocity * delta
		
		player_car.velocity = player_car.velocity.rotated(angular_velocity * delta)

	player_car.velocity = player_car.velocity.minf(player_car.max_speed)
	
	player_car.velocity = player_car.velocity.move_toward(Vector2.ZERO, player_car.friction * delta)
	
	var collision = player_car.move_and_slide()
	if collision and !player_car.velocity.length() < 20:
		player_car.play_collision_anim()
		player_car.velocity.move_toward(Vector2.ZERO, delta)
