extends Node2D
@export var Tile_Map : TileMapLayer
var astar_grid

func _ready():
	astar_grid = AStarGrid2D.new()
	astar_grid.region = Rect2i (%Map_1.get_used_rect())
	astar_grid.cell_size = Vector2(16,16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE
	astar_grid.offset = Vector2 (0,0)
	astar_grid.update()
	bake_grid();
	
func bake_grid():
	var tile_map_data = Tile_Map.get_used_cells()
	print(tile_map_data)
	for cell in tile_map_data:
		var data = Tile_Map.get_cell_tile_data(cell)
		if data.get_custom_data("is_wall"):
			astar_grid.set_point_solid(cell)
