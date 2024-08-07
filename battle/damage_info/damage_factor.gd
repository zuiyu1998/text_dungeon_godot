extends RefCounted
class_name DamageFactor

enum FactorType {Number, Dice}

# 数值
var number: int
# 骰子
var dice: DndDice
# 影响因子的因素
var factor_type: DamageFactor.FactorType

# 来源
var source: Node

func get_result() -> DamageFactorResult:
	var res = DamageFactorResult.new()
	res.factor_type = factor_type
	res.source = source
	
	match factor_type:
		FactorType.Number:
			res.value = number
			res.number_result = number
		FactorType.Dice:
			var dice_res = dice.get_result()
			res.value = dice_res.value
			res.dice_result = dice_res
	
	return res

class DamageFactorResult:
	var value: int
	var source: Node
	var factor_type: DamageFactor.FactorType
	var number_result: int
	var dice_result: DndDice.DiceResult
