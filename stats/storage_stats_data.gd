class_name StorageStatsData
extends RefCounted

var _buff_manager: BuffManager

var max_health: float = 10.0

var dnd_props: DndProps = DndProps.new()

var race: Race = Race.new(1, 0, 0, 0)

func _init(buff_manager: BuffManager) -> void:
	_buff_manager = buff_manager

func to_dict() -> Dictionary:
	return {
		max_health = max_health,
		dnd_props = dnd_props.to_dict()
	}
	
func from_dict(dict: Dictionary) -> void:
	max_health = dict.max_health
	dnd_props.from_dict(dict.dnd_props)
