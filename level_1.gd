extends Node2D

@export var Tile_Map : TileMapLayer
var astar_grid
var player_position
var tile_position
var distance = {}
var queue: Array[Vector2i] = []
var distance_img
var distance_texture
var offset : Vector2i

func _ready():
	var rect = %Map_1.get_used_rect()
	offset =  rect.position
	astar_grid = AStarGrid2D.new()
	astar_grid.region = Rect2i (rect)
	astar_grid.cell_size = Vector2(16,16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_AT_LEAST_ONE_WALKABLE
	astar_grid.offset = offset
	astar_grid.update()
	bake_grid();
	%ColorRect.global_position = Vector2(offset) * 16
	%ColorRect.size = Vector2(rect.size)*16
	distance_img = Image.create(rect.size.x,rect.size.y,false,Image.FORMAT_RF)
	distance_img.fill(Color(1.0,0.0,0.0))
	distance_texture = ImageTexture.create_from_image(distance_img)
	
func bake_grid():
	var tile_map_data = Tile_Map.get_used_cells()
	print(tile_map_data)
	for cell in tile_map_data:
		var data = Tile_Map.get_cell_tile_data(cell)
		if data.get_custom_data("is_wall"):
			astar_grid.set_point_solid(cell)
func flood_fill():
	distance.clear()
	queue.clear()
	distance_img.fill(Color(1.0,0.0,0.0))
	
	player_position = %Borivoj.global_position
	tile_position = Tile_Map.local_to_map(player_position)
	queue.push_back(tile_position)
	distance[tile_position] = 0
	print(tile_position)
	
	while not queue.is_empty():
		var current = queue.pop_front()
		var directions = [Vector2i.UP, Vector2i.DOWN,Vector2i.LEFT,Vector2i.RIGHT]
		for dir in directions:
				var neighbour = current + dir
				if not astar_grid.region.has_point(neighbour):
					continue
				if astar_grid.is_point_solid(neighbour):
					continue
				if distance.has(neighbour):
					continue
				distance[neighbour] = distance[current] + 1
				queue.push_back(neighbour)
	print(distance.size())
	for tile_position in distance:
		var distance_cur = distance[tile_position]
		var furtherness = float(distance_cur) / 20
		var offset_position = tile_position - offset
		distance_img.set_pixelv(offset_position, Color(furtherness,0,0))
	%ColorRect.material.set_shader_parameter("distance_map", distance_texture)
	%ColorRect.texture_filter = CanvasItem.TEXTURE_FILTER_NEAREST
	distance_texture.update(distance_img)
func _input(event):
	if Input.is_action_just_pressed("echo"):
		flood_fill()
