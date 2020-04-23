extends KinematicBody2D

var FRICTION = 500
var knockback = Vector2.ZERO

onready var stats = $Stats

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO,FRICTION*delta)
	knockback = move_and_slide(knockback)


func _on_Hitbox_area_entered(area):
	stats.health -= 50
	knockback = area.knockback_direction * 120


func _on_Stats_no_health():
	queue_free()
