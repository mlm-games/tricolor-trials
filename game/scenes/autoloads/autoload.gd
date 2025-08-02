## Should be set as the autoload by default, can call (global) creation and add_child to this instead of getting the scene tree everytime.
extends Node #class_name A for Autoload

static var tree : SceneTree = Engine.get_main_loop()

static var game_timer := Timer.new()

static var elapsed_time := 0.0

static var gameplay_time := 0.0

func  _ready() -> void:
	add_child(game_timer)
	game_timer.timeout.connect(func(): elapsed_time += 1)
	game_timer.start()

func start_gameplay_timer():
	game_timer.timeout.connect(func(): gameplay_time += 1)
