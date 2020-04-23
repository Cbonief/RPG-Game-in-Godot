extends Node2D

onready var animation = $AnimatedSprite

func _ready():
	animation.frame = 0
	animation.play("Destroy")
	
func _on_AnimatedSprite_animation_finished():
	queue_free()
