class_name BaseLevel extends Node2D

static var I: BaseLevel

func _init() -> void:
	I = self

@onready var level_id = name.to_upper() 

@export var color_order : Array[LevelTileMap.LevelType] = [LevelTileMap.LevelType.Gray]

@onready var tilemaps :  = get_children().filter(func(c): return c is LevelTileMap)

func _ready() -> void:
	FinishLine.I.crossed.connect(print_tree)

func complete_level():
	print("Level completed: " + str(level_id))
	
	LevelManager.I.advance_to_next_level()
