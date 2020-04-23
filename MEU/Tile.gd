extends Node2D

var randomizer = preload("res://Tiles/Randomizer.gd")

var Floor = [preload("res://Tiles/Floor.tscn"), preload("res://Tiles/Floor_Rock.tscn"),
preload("res://Tiles/Floor_Grass1.tscn"), preload("res://Tiles/Floor_Grass2.tscn"), 
preload("res://Tiles/Floor_Grass3.tscn")]

func _ready():
	var sprite = Floor[randomizer.random_with_distribution([0.55, 0.05, 0.15, 0.15, 0.10])].instance()
	sprite.centered = false
	sprite.position = Vector2(0, 0)
	var size = sprite.get_texture().get_size() #image size
	var th = 50 #target height
	var tw = 50 #target width
	var scale = Vector2((size.x/(size.x/tw))/100, (size.y/(size.y/th))/100)
	sprite.set_scale(scale)
	add_child(sprite)
