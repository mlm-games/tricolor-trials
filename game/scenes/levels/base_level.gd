class_name BaseLevel extends Node2D

static var I: BaseLevel

func _init() -> void:
	I = self

@export var color_order : Array[LevelTileMap.LevelType] = [LevelTileMap.LevelType.Base]

@onready var tilemaps :  = get_children().filter(func(c): return c is LevelTileMap)

func _ready() -> void:
	FinishLine.I.crossed.connect(print_tree)
	
