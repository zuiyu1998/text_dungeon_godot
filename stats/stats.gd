class_name Stats
extends Node

signal die

# stats受到的effect
var _effects : Array[StatsEffect] = []

# 原始数据
var _storage_data := StorageStatsData.new()

var storage := StorageStatsData.new()
var memory := MemoryStatsData.new()

func get_state() -> StatsState:
	var tmp_storage := StorageStatsData.new()
	tmp_storage.from_dict(_storage_data.to_dict())
	var tmp_state := StatsState.new(tmp_storage, memory)
	return tmp_state

func apply_effects(effects: Array[StatsEffect]) -> void:
	var tmp_state = get_state()

	for effect in effects:
		effect.update(tmp_state)
	storage = tmp_state.storage
	
func apply_effect(effect: StatsEffect) -> void:
	apply_effects([effect])

func flush_state() -> void:
	apply_effects(_effects)
	

