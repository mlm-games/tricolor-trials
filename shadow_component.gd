@tool
class_name TilemapShadowComponent extends Node2D

@export var shadow_offset: Vector2 = Vector2(-10, 10)
@export var shadow_color: Color = Color(Color.BLACK, 0.5)
@export var enabled: bool = true : set = set_enabled

var shadow_layer: TileMapLayer
var parent_layer: TileMapLayer

func _ready() -> void:
	parent_layer = get_parent() as TileMapLayer
	
	z_index = -1
	
	_create_shadow()

func _create_shadow() -> void:
	if shadow_layer and is_instance_valid(shadow_layer): shadow_layer.queue_free()
	
	shadow_layer = TileMapLayer.new()
	shadow_layer.name = "Shadow"
	
	shadow_layer.tile_set = parent_layer.tile_set
	shadow_layer.rendering_quadrant_size = parent_layer.rendering_quadrant_size
	
	# Copy tiles (Direct duplication causes infinite recursion due to the children also being duplicated, instantiate flag didn't work)
	for coord in parent_layer.get_used_cells():
		shadow_layer.set_cell(
			coord,
			parent_layer.get_cell_source_id(coord),
			parent_layer.get_cell_atlas_coords(coord),
			parent_layer.get_cell_alternative_tile(coord)
		)
	
	# Configure shadow
	shadow_layer.modulate = shadow_color
	shadow_layer.position = shadow_offset
	shadow_layer.collision_enabled = false
	shadow_layer.navigation_enabled = false
	
	add_child(shadow_layer)
	
	move_child(shadow_layer, 0) # For drawing below blockers

func set_enabled(value: bool) -> void:
	enabled = value
	visible = value

func _process(_delta: float) -> void:
	if Engine.is_editor_hint():
		if shadow_layer and parent_layer.get_used_cells().size() != shadow_layer.get_used_cells().size():
			_create_shadow()
