extends Area2D

var playerClose = false

signal playerInteract

func _on_ClickBox_area_entered(area):
	playerClose = true

func _on_ClickBox_area_exited(area):
	playerClose = false

func _on_ClickBox_input_event(viewport, event, shape_idx):
	if (event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT and playerClose):
		emit_signal("playerInteract")
