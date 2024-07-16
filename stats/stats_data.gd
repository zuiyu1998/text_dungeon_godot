extends RefCounted
class_name StatsData

signal health_change

var health : float = 10.0
var max_health: float = 10.0


func update_health() -> void:
	var v = min(max_health, health)
	if v != health:
		health = v
		health_change.emit()


func update_by_storage_and_memory(storage: StorageStatsData, memory: MemoryStatsData) -> void:
	max_health = storage.max_health
	health = memory.health


