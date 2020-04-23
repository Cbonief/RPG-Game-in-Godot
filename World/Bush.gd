extends StaticBody2D

var mouseOn = false
var playerClose = false

var ItemNode = preload("res://UI/Item.tscn")

onready var inventory = $Inventory

func _ready():
	randomize()
	var bush = ItemNode.instance()
	bush.init("Arma", "res://World/Bush.png")
	inventory.add_item(bush)
	inventory.inventory_size += 1
	for i in range(0, 3):
		var val = randi() % 100 + 1
		if val > 50:
			bush = ItemNode.instance()
			bush.init("Arma", "res://World/Bush.png")
			inventory.add_item(bush)
			inventory.inventory_size += 1


func _on_ClickBox_playerInteract():
	inventory.open_gui()
