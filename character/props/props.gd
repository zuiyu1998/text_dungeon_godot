class_name Props

var data: Dictionary

func get_prop(key: PropEnum) -> PropValue:
	return data[key.key]

func set_prop(key: PropEnum, value: PropValue):
	data[key.key] = value

func _init() -> void:
	set_prop(Initiative.new(), PropValue.new())
