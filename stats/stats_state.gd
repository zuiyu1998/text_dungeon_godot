class_name StatsState
extends RefCounted

var storage : StorageStatsData
var memory : MemoryStatsData 


func _init(storage_data: StorageStatsData, memory_data: MemoryStatsData) -> void:
	storage = storage_data
	memory = memory_data

