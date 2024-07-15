class_name StorageStatsData
extends RefCounted

var _buff_manager: BuffManager

var max_health: float = 10.0

func _init(buff_manager: BuffManager) -> void:
	_buff_manager = buff_manager

func to_dict() -> Dictionary:
	return {
		max_health = max_health
	}
	
func from_dict(dict: Dictionary) -> void:
	max_health = dict.max_health
