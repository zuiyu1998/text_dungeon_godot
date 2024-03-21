extends Buffer

var props_list = [Power.new()]

func add_prop(props: CharacterProps, prop_enum: PropEnum, add: int):
	var props_value = props.get_prop(prop_enum)
	
	var value = props_value.get_value()
	props_value.set_value(value + add)

func update_charactor_instance(instance: CharacterInstance):
	for prop in props_list:
		add_prop(instance.props, prop, 5)
