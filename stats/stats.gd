class_name Stats
extends Node

signal die

@export var buff_manager: BuffManager

# stats受到的effect
var _effects : Array[StatsEffect] = []

# 原始数据
var _storage_data := StorageStatsData.new(buff_manager)

var storage := StorageStatsData.new(buff_manager)
var memory := MemoryStatsData.new()


func _ready() -> void:
	var buffer = BuffFactory.get_buff(0)
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
	
func apply_effect(effect: StatsEffect) -> void:
	apply_effects([effect])

func flush_state() -> void:
	apply_effects(_effects)
	

