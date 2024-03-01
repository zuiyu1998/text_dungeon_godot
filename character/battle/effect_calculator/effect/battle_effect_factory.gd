class_name BattleEffectFactory

const EFFECT_LIST = [
	preload ("res://character/battle/effect_calculator/effect/damage_effect.gd")
]

static func _get_effct(id: int) -> BattleEffect:
	var script = EFFECT_LIST[id] as Script
	var effect = script.new() as BattleEffect
	return effect

static func get_effct_list(effct_ids: Array) -> Array:
	return effct_ids.map(func(id): return _get_effct(id))
