extends Node

# Name and category
export(String) var Name setget set_Name
export(String, 
				'Other',
				'Armor',
				'Consumable',
				'Weapon',
				'Quiver'
)onready var general_category
export(String) var specific_category

# Textures
onready var game_texture
onready var slot_texture

signal name_changed

func init(_name, texture_path):
	self.Name = _name
	slot_texture = load(texture_path)

func set_Name(value):
	Name = value
	emit_signal('name_changed', value)
