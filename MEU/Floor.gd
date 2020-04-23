extends Node2D

var Tile = preload("res://Tiles/Tile.tscn")

var size = [15, 13]

func _ready():
	randomize()
	make_floor()

func make_floor():
	for col in range(size[0]):
		for row in range(size[1]):
			print("Row = " + str(row) + " Col = " + str(col))
			var new_tile = Tile.instance()
			new_tile.position.x = col*50
			new_tile.position.y = row*50
			add_child(new_tile)
		
