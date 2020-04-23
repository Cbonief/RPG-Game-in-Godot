extends Area2D

onready var mouseIn = false

func _process(delta):
	if mouseIn and Input.is_action_pressed("clicked"):
		print("Draggin")
		set_position(get_viewport().get_mouse_position())

func _on_Area2D_mouse_entered():
	mouseIn = true
	print("Oi")

func _on_Area2D_mouse_exited():
	mouseIn = false
