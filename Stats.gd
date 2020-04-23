extends Node

export(int) var max_health = 100
onready var health = max_health setget set_health

#export(int, 'D4', 'D6', 'D8', 'D10', 'D12') var Strength
#export(int, 'D4', 'D6', 'D8', 'D10', 'D12') var Agility
#export(int, 'D4', 'D6', 'D8', 'D10', 'D12') var Wisdom
#export(int, 'D4', 'D6', 'D8', 'D10', 'D12') var Spirity
#export(int, 'D4', 'D6', 'D8', 'D10', 'D12') var Vigor

export(int, 1, 10) var Strength
export(int, 1, 10) var Agility
export(int, 1, 10) var Wisdom
export(int, 1, 10) var Spirity
export(int, 1, 10) var Vigor

signal no_health


func set_health(value):
	health = value
	if health <= 0:
		emit_signal("no_health")
