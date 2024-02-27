class_name Character

var props_meta: CharacterPropsMeta = CharacterPropsMeta.new()

var props: Props:
	get:
		return _props

var _props: Props = Props.new()

func _get_props(id: int):
	var model := Global.character_props_db.get_id(id)
	_props.initiative_id = model.initiative_id
	
	for prop_value in model.prop_values:
		var value = PropValue.new()
		var prop_enum = PropEnum.get_prop_enum(prop_value["prop_enum"])
		value.set_value(prop_value.value)
		value.set_max(prop_value.max)
		_props.set_prop(prop_enum, value)
		pass	

func _init() -> void:
	_get_props(props_meta.id)
