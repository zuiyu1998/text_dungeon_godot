class_name HitCalculatorFactory

const HITCALCULATOR_LIST = [
	preload("res://character/battle/hit_calculator/default_hit_calculator.gd")
]

static func get_id(id: int) -> HitCalculator:
	var script = HITCALCULATOR_LIST[id] as Script
	var hit_calculator = script.new() as HitCalculator
	return hit_calculator
