class_name MemoryStatsData
extends RefCounted

var health : float = 10.0

func update_health(max_health: float) -> void:
	var v = min(max_health, health)
	if v != health:
		health = v
	
func update_by_storage(storage: StorageStatsData) -> void:
	update_health(storage.max_health)
