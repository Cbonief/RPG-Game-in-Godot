extends Control

var ItemNode = preload("res://UI/Item.tscn")

onready var Item = null
onready var hasItem = false
onready var mouseInItem = false
onready var other_is_colliding = false
onready var otherSlot = null
onready var colliding_with_other = false

onready var textureRect = $ZIndexNode/ItemTexture
onready var itemBox = $ZIndexNode/ItemTexture/ItemBox

signal added_item
signal removed_item
signal slot_ready

func give_item(_item, other):
	hasItem = true
	Item = _item
	textureRect.texture = _item.slot_texture
	snap_item()
	if other.get_parent() != self.get_parent():
		emit_signal('added_item', Item)

func add_item(_item):
	hasItem = true
	Item = _item
	textureRect.texture = _item.slot_texture
	snap_item()

func remove_item():
	hasItem = false
	textureRect.texture = null
	snap_item()
	Item = null
	
func snap_item():
	textureRect.rect_position = Vector2(2,2)

func _ready():
	print("Slot Ready")
	var gui = get_parent().get_parent()
	self.connect("slot_ready", gui, "slot_ready")
	emit_signal("slot_ready")
	self.connect("added_item", gui, "add_item")
	self.connect("removed_item", gui, "remove_item")

func _process(delta):
	if mouseInItem and hasItem and Input.is_action_pressed("clicked"):
		var pos = get_global_mouse_position() - Vector2(5,5)
		textureRect.set_global_position(pos)
		$ZIndexNode.z_index = 5
		itemBox.monitorable = true

	if Input.is_action_just_released("clicked"):
		if colliding_with_other:
			otherSlot.give_item(Item, self)
			if otherSlot.get_parent() != self.get_parent():
				emit_signal("removed_item", Item)
				print("Removed item")
			remove_item()
		else:
			snap_item()
		itemBox.monitorable = false

func _on_ItemTexture_mouse_entered():
	mouseInItem = true

func _on_ItemTexture_mouse_exited():
	mouseInItem = false

func _on_ItemBox_area_shape_entered(area_id, area, area_shape, self_shape):
	var other = area.get_parent()
	if other != self and !other.hasItem:
		otherSlot = other
		colliding_with_other = true
	else:
		colliding_with_other = false


func _on_ItemBox_area_shape_exited(area_id, area, area_shape, self_shape):
	var other = area.get_parent()
	if other != self and otherSlot != otherSlot:
		colliding_with_other = false
