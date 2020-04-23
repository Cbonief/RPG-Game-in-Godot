extends KinematicBody2D

var ItemNode = preload("res://UI/Item.tscn")

# Positional and Physics variables.
var velocity = Vector2.ZERO
var roll_vector = Vector2.LEFT
export var MAX_SPEED = 80
export var ACCELERATION = 500
export var FRICTION = 500
export var ROLL_SPEED = 120

enum {
	GRASS,
	ROAD
}

enum {
	MOVE,
	ROLL,
	ATTACK
}

var State = MOVE

onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var SwordHurtbox = $HurtboxPivot/Hurtbox

func _ready():
	animationTree.active = true
	SwordHurtbox.knockback_direction = Vector2.ZERO

func _process(delta):
	match State:
		MOVE:
			move_state(delta)
		ROLL:
			roll_state(delta)
		ATTACK:
			attack_state(delta)
	
	
func set_state_move():
	velocity = Vector2.ZERO
	State = MOVE

func roll_animation_finished():
	velocity = velocity / 2
	State = MOVE

func move_state(delta):
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input = input.normalized()
	
	if input != Vector2.ZERO:
		roll_vector = input
		SwordHurtbox.knockback_direction = input
		animationTree.set("parameters/Idle/blend_position", input)
		animationTree.set("parameters/Run/blend_position", input)
		animationTree.set("parameters/Attack/blend_position", input)
		animationTree.set("parameters/Roll/blend_position", input)
		animationState.travel("Run")
		velocity = velocity.move_toward(input * MAX_SPEED, ACCELERATION * delta)
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	if Input.is_action_just_pressed("attack"):
		State = ATTACK
	if Input.is_action_just_pressed("roll"):
		State = ROLL
		
	move()
		
func roll_state(delta):
	velocity = roll_vector * ROLL_SPEED
	animationState.travel("Roll")
	move()

func attack_state(delta):
	animationState.travel("Attack")

func move():
	velocity = move_and_slide(velocity)
