extends TextureRect

export(Texture) var mouse_in_Texture
export(Texture) var mouse_off_Texture
var mouseOn = false setget set_mouseOn

signal mouse_clicked

func _input(event):
	if event.is_action_pressed("clicked") and mouseOn:
		emit_signal("mouse_clicked")


func _on_CloseButton_mouse_entered():
	mouseOn = true


func _on_CloseButton_mouse_exited():
	mouseOn = false
	
func set_mouseOn(value):
	if value != mouseOn:
		mouseOn = value
		set_texture(value)
