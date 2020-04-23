extends Control

var itemSlot = preload("res://UI/ItemSlot.tscn")
var temp = []
var added = []
var removed = []
var mouseOn = false
var slots_created = 0
var all_slots_created = false

var number_of_slots
var scale_factor = Vector2(0.75, 0.75)
var spacing = Vector2(2,2)
var dimension

signal closed

func create(dimensions):
	number_of_slots = dimensions.x * dimensions.y
	var needed_size = [(14+self.spacing.x)*dimensions.x + self.spacing.x, (14+self.spacing.y)*dimensions.y + self.spacing.y]
	# Configure the slots dimensions and spacing.
	for i in range(0, number_of_slots):
		$Slots.add_child(itemSlot.instance())
	$Slots.columns = dimensions.x
	$Slots.add_constant_override("hseparation", self.spacing.x)
	$Slots.add_constant_override("vseparation", self.spacing.y)
	$Slots.rect_position = Vector2(5 + self.spacing.x, 6 + self.spacing.y)
	$Slots.rect_size = Vector2(needed_size[0] - self.spacing.x, needed_size[1] - self.spacing[1])
	
	$Background.rect_size = Vector2(needed_size[0],needed_size[1])
	
	# Setting the edge's size.
	var edge_left_length = needed_size[1] - 4
	var edge_up_length = needed_size[0] - 6
	$Edges/Up.rect_size.x = edge_up_length
	$Edges/Down.rect_size.x = needed_size[0] - 4
	$Edges/Left.rect_size.y = edge_left_length
	$Edges/Right.rect_size.y = needed_size[1] - 7
	
	# Setting all positions.
	$Decorations/BottomLeft.rect_position.y = 15 + edge_left_length
	$Edges/Down.rect_position.y = 10 + edge_left_length
	$Edges/Right.rect_position.x = 11 + edge_up_length
	$CloseButton.rect_position.x = 7 + edge_up_length
	$Decorations/BottomRight.rect_position.x = 16 + edge_up_length
	$Decorations/BottomRight.rect_position.y = 8 + edge_left_length
	
	rect_scale = self.scale_factor
	dimension = dimensions

func add_slots(value):
	var new_y = int(ceil(value/dimension.x))
	dimension.y += new_y
	var dimensions = dimension
	number_of_slots = dimensions.x * dimensions.y
	var needed_size = [(14+self.spacing.x)*dimensions.x + self.spacing.x, (14+self.spacing.y)*dimensions.y + self.spacing.y]
	# Configure the slots dimensions and spacing.
	for i in range(0, dimensions.x):
		for j in range(0, new_y):
			$Slots.add_child(itemSlot.instance())
	$Slots.columns = dimensions.x
	$Slots.add_constant_override("hseparation", self.spacing.x)
	$Slots.add_constant_override("vseparation", self.spacing.y)
	$Slots.rect_position = Vector2(5 + self.spacing.x, 6 + self.spacing.y)
	$Slots.rect_size = Vector2(needed_size[0] - self.spacing.x, needed_size[1] - self.spacing[1])
	
	$Background.rect_size = Vector2(needed_size[0],needed_size[1])
	
	# Setting the edge's size.
	var edge_left_length = needed_size[1] - 4
	var edge_up_length = needed_size[0] - 6
	$Edges/Up.rect_size.x = edge_up_length
	$Edges/Down.rect_size.x = needed_size[0] - 4
	$Edges/Left.rect_size.y = edge_left_length
	$Edges/Right.rect_size.y = needed_size[1] - 7
	
	# Setting all positions.
	$Decorations/BottomLeft.rect_position.y = 15 + edge_left_length
	$Edges/Down.rect_position.y = 10 + edge_left_length
	$Edges/Right.rect_position.x = 11 + edge_up_length
	$CloseButton.rect_position.x = 7 + edge_up_length
	$Decorations/BottomRight.rect_position.x = 16 + edge_up_length
	$Decorations/BottomRight.rect_position.y = 8 + edge_left_length
	
func set_inventory(inventory):
	print("Needs %s slots" %str(inventory.inventory_size))
	temp = inventory
	if number_of_slots >= inventory.inventory_size:
		if all_slots_created:
			allocate_items()
	else:
		all_slots_created = false
		add_slots(inventory.inventory_size - number_of_slots)

func slot_ready():
	print("Slot emitted signal and worked")
	slots_created += 1
	if slots_created == number_of_slots:
		all_slots_created = true
		if temp:
			allocate_items()

func allocate_items():
	print("Items being allocated")
	for i in range(0, temp.inventory_size):
		$Slots.get_child(i).add_item(temp.items[i])
	temp = null

func add_item(item):
	added.append(item)

func remove_item(item):
	removed.append(item)

func _on_CloseButton_pressed():
	emit_signal("closed", added, removed)
	queue_free()
