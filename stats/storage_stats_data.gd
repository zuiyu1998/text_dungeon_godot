class_name StorageStatsData
extends RefCounted

var _buff_manager: BuffManager

# 最大血量
var max_health: float = 0.0

# dnd 属性
var dnd_props: DndProps = DndProps.new()

# 种族
var race: Race = Race.new(1, 0, 0, 0)

func _init(buff_manager: BuffManager) -> void:
	_buff_manager = buff_manager
	max_health += _get_new_max_health(true)
	dnd_props = race.props
	

func _get_new_max_health(is_frist = false) -> int:
	var dice = HealthDice.new()

	dice.set_health_dice(race.model.health_dice)

	return dice.get_health_value(is_frist)

func to_dict() -> Dictionary:
	return {
		max_health = max_health,
		dnd_props = dnd_props.to_dict()
	}
	
func from_dict(dict: Dictionary) -> void:
	max_health = dict.max_health
	dnd_props.from_dict(dict.dnd_props)
