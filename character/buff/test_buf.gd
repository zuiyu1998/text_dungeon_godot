extends Buffer

func update_charactor_instance(instance: CharacterInstance):
	var props_value = instance.props.get_prop(Power.new())
	
	var value = props_value.get_value()
	props_value.set_value(value + 1)
	

func _init():
	pass
