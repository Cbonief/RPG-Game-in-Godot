extends "res://Items/Inventory.gd"

#Auxiliar variables
var armorTypes = ['Helmet', 'Chestpiece', 'Boots', 'Legs']
var lefthandTypes = ['Shield', 'Weapon']
var righthandTypes = ['Consumables', 'Weapon']
var backTypes = ['Quiver']
var neckTypes = ['Necklace']

signal item_equipped

# Item variables
var equipped = {
	'Helmet': null,
	'Chestplate': null,
	'Legs': null,
	'Boots': null,
	'LeftHand': null,
	'RightHand': null,
	'Neck': null,
	'Back': null
}

#func equip(item, spot = null) -> void:
#	var sucess = false
#	var function = 'put_item_in_spot'
#	if spot:
#	if item.general_category == 'Armor':
#		call(function, item.specific_category, item)
#	else:
#		if spot in armorTypes and item.category is spot:
#			if equipped[spot]:
#				call(function, spot, item)
#			else:
#				equipped[spot] = item
#		if spot == 'Lefthand' and item.category in lefthandTypes:
#			var right_hand = equipped['Righthand']
#			if right_hand:
#				if right_hand.type == 'Weapon':
#					if not right_hand.two_handed:
#						if item.category == 'Weapon':
#							if item.dual_wieldable:
#								call(function, spot, item)
#						else:
#							call(function, spot, item)
#				else:
#					if item.category == 'Weapon':
#						if item.dual_wieldable:
#							equipped[spot] = item
#					else:
#						equipped[spot] = item
#			else:
#				if item.category == 'Weapon':
#					if item.dual_wieldable:
#						equipped[spot] = item
#				else:
#					equipped[spot] = item
#		if spot == 'Righthand' and item.category in righthandTypes:
#			var left_hand = equipped['Righthand']
#			if left_hand:
#				if item.general_category == 'Weapon':
#					if not item.two_handed:
#						call(function, spot, item)
#						return
#				else:
#					call(function, spot, item)
#					return
#			else:
#				put_item_in_spot(spot, item)
#		if spot == 'Neck' and item.category in neckTypes:
#			call(function, spot, item)
#
#
#func swap(spot, item):
#	var temp = equipped[spot]
#	item.append(temp)
#	put_item_in_spot(spot, item)
#	items.remove(item)
#
#func put_item_in_spot(spot, item):
#	equipped[spot] = item
#	emit_signal('item_equipped', true, spot)
