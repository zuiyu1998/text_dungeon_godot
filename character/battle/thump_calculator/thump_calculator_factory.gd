class_name ThumpCalculatorFactory

const THUMP_CALCULATOR_LIST = [
	preload("res://character/battle/thump_calculator/default_thump_calculator.gd")
]

static func get_id(id: int) -> ThumpCalculator:
	var script = THUMP_CALCULATOR_LIST[id] as Script
	var thump_calculator = script.new() as ThumpCalculator
	return thump_calculator
