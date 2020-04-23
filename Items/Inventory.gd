extends Node

var InventoryGUI = preload("res://UI/InventoryGUI.tscn")

# Item variables.
var items = []
export(float) var max_weigth
export(int) var inventory_size = 0
var gui_open = false

func open_gui():
	if not gui_open:
		gui_open = true
		var inventoryGUI = InventoryGUI.instance()
		inventoryGUI.create(Vector2(2,2))
		inventoryGUI.set_inventory(self)
		inventoryGUI.set_position(Vector2(0, -40) + get_parent().global_position)
		inventoryGUI.connect("closed", self, "_on_gui_closed")
		get_tree().current_scene.add_child(inventoryGUI)

func _on_gui_closed(added, removed):
	for item in added:
		add_item(item)
		inventory_size += 1
	for item in removed:
		remove_item(item)
		inventory_size -= 1
	gui_open = false


func add_item(item):
	items.append(item)


func remove_item(item):
	items.remove(items.find(item))
