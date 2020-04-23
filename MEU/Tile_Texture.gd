extends CanvasLayer

func dir_contents(path):
	var dir = Directory.new()
	var data = []
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if not ("import" in file_name):
				data.push_back(load(path + "//" + file_name))
			file_name = dir.get_next()
	return data

func _ready():
	textures = dir_contents("Resources//Tiles")

