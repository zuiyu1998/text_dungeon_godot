extends Node
class_name Character

signal damage

var props_meta: CharacterMeta = CharacterMeta.new()

var props: CharacterProps = CharacterProps.new()

var state: CharacterState = CharacterState.new()

func get_instance() -> CharacterInstance:
	var instance = CharacterInstance.new()
	instance.state = state.clone();

	instance.props = props.clone();

	BuffFactory.update_instance(instance)

	print("dd", instance.props.get_prop(Power.new()).get_value())

	return instance

func on_damage(damage_info: DamageInfo):
	state.update_damage(damage_info.damage)
	damage.emit(damage_info)

func _init_state():
	state.from_props(props)

func _get_props(id: int):
	var model := Global.character_props_db.get_id(id)
	props.initiative_id = model.initiative_id
	
	for prop_value in model.prop_values:
		var value = PropValue.new()
		var prop_enum = PropEnum.get_prop_enum(prop_value["prop_enum"])
		value.set_value(prop_value.value)
		value.set_max(prop_value.max_value)
		props.set_prop(prop_enum, value)

	for dice in model.dices:
		var prop_enum = PropEnum.get_prop_enum(dice["prop_enum"])
		props.set_dice_trend(prop_enum, dice.trend)
		props.set_dice_max(prop_enum, dice.max_number)

func _init() -> void:
	_get_props(props_meta.props_id)
	_init_state()
