extends Node2D

static func random_with_distribution(distribution):
	var random_value = randf()
	var sum = 0
	var choice = 0
	for index in range(len(distribution)):
		if sum <= random_value and random_value < sum + distribution[index]:
			choice = index
		sum += distribution[index]
	return choice
