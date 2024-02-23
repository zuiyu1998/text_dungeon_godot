class_name Props

var data: Dictionary
var initiative_id = 0

func get_prop(key: PropEnum) -> PropValue:
	return data[key.key]

func set_prop(key: PropEnum, value: PropValue):
	data[key.key] = value

