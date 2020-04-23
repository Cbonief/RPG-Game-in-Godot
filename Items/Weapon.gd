extends "res://Item.gd"

export(int) var damage
export(int) var dual_wieldable = false setget set_dual_wieldable
export(int) var two_handed = false setget set_two_handed

func set_two_handed(value):
	two_handed = value
	if two_handed:
		dual_wieldable = false
		
func set_dual_wieldable(value):
	dual_wieldable = value
	if dual_wieldable:
		two_handed = false
