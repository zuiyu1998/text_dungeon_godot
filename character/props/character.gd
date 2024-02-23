class_name Character

var props_meta: CharacterPropsMeta = CharacterPropsMeta.new()

var props: Props = Props.new()

func get_props(id: int) -> Props:
	var props = Props.new()
	
	var model := Global.character_props_db.get_id(id)
	props.initiative_id = model.initiative_id
	
	for prop_value in model.prop_values:
		var value = PropValue.new()
		var prop_enum = PropEnum.get_prop_enum(prop_value["prop_enum"])
		value.set_value(prop_value.value)
		value.set_max(prop_value.max)
		props.set_prop(prop_enum, value)
		pass
	
	return props

func _init() -> void:
	props = get_props(props_meta.id)
