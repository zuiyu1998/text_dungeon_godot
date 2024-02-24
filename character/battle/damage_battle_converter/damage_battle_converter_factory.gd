class_name DamageBattleConverterFactory

const CONVERTER_LIST = [
	preload("res://character/battle/damage_battle_converter/default_damage_battle_converter.gd")
]

static func get_converter(id: int) -> DamageBattleConverter:
	var script = CONVERTER_LIST[id] as Script
	var converter = script.new() as DamageBattleConverter
	return converter

