extends Node2D

var destroyEffect = preload("res://Effects/GrassEffect.tscn")

func play_destroy_grass():
	var animation = destroyEffect.instance()
	animation.global_position = global_position
	get_tree().current_scene.add_child(animation)

func _on_Hitbox_area_entered(area):
	play_destroy_grass()
	queue_free()
