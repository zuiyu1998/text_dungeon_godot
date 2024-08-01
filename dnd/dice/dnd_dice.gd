extends RefCounted

class_name DndDice

enum DiceTrend {
	# 正常
	Normal,
	# 优势
	Advantage,
	# 劣势
	DisAdvantage
}

enum DiceResultType {
	Number,
	# 大成功
	Success,
	# 大失败
	Fail,
}

# 最大值
var max_value: int = 20
# 优劣势
var dice_trend: DiceTrend = DiceTrend.Normal
# 成功加值
var success_value: int = 0
# 成功减值
var fail_value: int = 0

func _get_dice_result(value: int) -> DiceResultType:
	if (value + success_value) >= max_value:
		return DiceResultType.Success
	elif value <= 0 + fail_value:
		return DiceResultType.Fail
	else:
		return DiceResultType.Number

func _get_rng_value() -> int:
	var rng = RandomNumberGenerator.new()
	var rng_value = rng.randi_range(0, max_value)
	var value = rng_value + 1
	return value

# 投骰子
func get_result() -> DiceResult:
	var res := DiceResult.new()
	res.dice_trend = dice_trend

	if dice_trend == DiceTrend.Normal:
		var value = _get_rng_value()

		res.value = value
		res.result_type = _get_dice_result(value)

		res.extra = {"first_value": value}

	else:
		var value1 = _get_rng_value()
		var value2 = _get_rng_value()

		var value: int

		if dice_trend == DiceTrend.Advantage:
			value = maxi(value1, value2)
		else:
			value = maxi(value1, value2)
		
		res.value = value
		res.result_type = _get_dice_result(value)

		res.extra = {"first_value": value1, "second_value": value2};

	return res

class DiceResult:
	var result_type: DiceResultType = DiceResultType.Fail
	var dice_trend: DiceTrend = DiceTrend.Normal
	var value: int = 0
	var extra: Dictionary = {}
