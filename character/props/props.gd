class_name Props

var data: Dictionary
var dice_trend: Dictionary
var dice_max: Dictionary

# 先攻id
var initiative_id: int = 0
# 攻击类型
var battle_enum: BattleEnum.Battle = BattleEnum.Battle.Slash
# 攻击类型转换器id
var battle_id: int = 0
# 命中计算器id
var hit_calculator_id: int = 0

func get_dice_trend(key: PropEnum) -> Dice.Trend:
	return dice_trend[key.key]

func set_dice_trend(key: PropEnum, trend: Dice.Trend):
	dice_trend[key.key] = trend

func get_dice_max(key: PropEnum) -> int:
	return dice_max[key.key]

func set_dice_max(key: PropEnum, new_value: int):
	dice_max[key.key] = new_value

func get_prop(key: PropEnum) -> PropValue:
	return data[key.key]

func set_prop(key: PropEnum, value: PropValue):
	data[key.key] = value

