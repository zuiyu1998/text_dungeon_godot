class_name Character

signal health

var props_meta: CharacterMeta = CharacterMeta.new()

var props: CharacterProps:
	get:
		return _props

var state: CharacterState:
	get:
		return _state

var _props: CharacterProps = CharacterProps.new()

var _state: CharacterState = CharacterState.new()

func update_health(damage: int):
	_state.update_damage(damage)
	health.emit()

func _init_state():
	_state.from_props(_props)

func _get_props(id: int):
	var model := Global.character_props_db.get_id(id)
	_props.initiative_id = model.initiative_id
	
	for prop_value in model.prop_values:
		var value = PropValue.new()
		var prop_enum = PropEnum.get_prop_enum(prop_value["prop_enum"])
		value.set_value(prop_value.value)
		value.set_max(prop_value.max_value)
		_props.set_prop(prop_enum, value)

	for dice in model.dices:
		var prop_enum = PropEnum.get_prop_enum(dice["prop_enum"])
		_props.set_dice_trend(prop_enum, dice.trend)
		_props.set_dice_max(prop_enum, dice.max_number)

func _init() -> void:
	_get_props(props_meta.props_id)
	_init_state()
