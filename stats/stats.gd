class_name Stats
extends Node

signal stats_update

@onready var buff_manager: BuffManager = $BuffManager

# stats受到的effect
var _effects: Array[StatsEffect] = []

# 原始数据
var _storage_data := StorageStatsData.new(buff_manager)

var storage := StorageStatsData.new(buff_manager)
var memory := MemoryStatsData.new()

var data: StatsData = StatsData.new()


func get_prop(prop: StringName) -> DndProp:
	return storage.dnd_props.get_prop(prop)

# 添加buf
func add_buff(id: int) -> void:
	var buffer := BuffFactory.get_buff(id)
	buffer.stats = self
	buff_manager.add_child(buffer)


func remove_effects(effects: Array[StatsEffect]) -> void:
	for effect in effects:
		_effects.erase(effect)
	
	flush_state()

func add_effects(effects: Array[StatsEffect]) -> void:
	for effect in effects:
		if effect in _effects:
			continue
		else:
			_effects.push_back(effect)
	
	flush_state()

func get_state() -> StatsState:
	var tmp_storage := StorageStatsData.new(buff_manager)
	tmp_storage.from_dict(_storage_data.to_dict())
	
	var tmp_state := StatsState.new(tmp_storage, memory)
	return tmp_state

func apply_effects(effects: Array[StatsEffect]) -> void:
	var tmp_state = get_state()
	for effect in effects:
		effect.update(tmp_state)
	storage = tmp_state.storage
	
	memory.update_by_storage(storage)
	data.update_by_storage_and_memory(storage, memory)
	
	stats_update.emit()
	
func apply_effect(effect: StatsEffect) -> void:
	apply_effects([effect])


func flush_state() -> void:
	apply_effects(_effects)
