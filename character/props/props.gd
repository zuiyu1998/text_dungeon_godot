extends Node
class_name CharacterProps

var _data: Dictionary
var _dice_trend: Dictionary
var _dice_max: Dictionary
var _damages: Dictionary

# 先攻id
var initiative_id: int = 0
# 攻击类型
var battle_enum: BattleEnum.Battle = BattleEnum.Battle.Slash
# 攻击类型转换器id
var battle_id: int = 0
# 命中计算器id
var hit_calculator_id: int = 0
# 重击计算器id
var thump_calculator_id: int = 0
# 结算器ids
var effect_ids: Array[int] = [0]
# buff_ids
var buf_ids: Array[int] = [0]

func clone() -> CharacterProps:
	var props = CharacterProps.new()

	props._data = CloneUtil.clone_dictionary(_data);
	props._damages = CloneUtil.clone_dictionary(_damages);
	props._dice_trend = CloneUtil.clone_dictionary(_dice_trend);
	props._dice_max = CloneUtil.clone_dictionary(_dice_max);
	props.initiative_id = initiative_id;
	props.battle_enum = battle_enum;
	props.battle_id = battle_id;
	props.hit_calculator_id = hit_calculator_id;
	props.thump_calculator_id = thump_calculator_id;
	props.effect_ids = effect_ids.duplicate(true);
	props.buf_ids = buf_ids.duplicate(true);

	return props

func _init():
	set_damage(PhysicalHit.new(), 2)
	set_damage(MagicHit.new(), 2)

func get_damage(key: PropEnum) -> int:
	return _damages[key.key]

func set_damage(key: PropEnum, value: int):
	_damages[key.key] = value

func get_dice_trend(key: PropEnum) -> Dice.Trend:
	return _dice_trend[key.key]

func set_dice_trend(key: PropEnum, trend: Dice.Trend):
	_dice_trend[key.key] = trend

func get_dice_max(key: PropEnum) -> int:
	return _dice_max[key.key]

func set_dice_max(key: PropEnum, new_value: int):
	_dice_max[key.key] = new_value

func get_prop(key: PropEnum) -> PropValue:
	return _data[key.key]

func set_prop(key: PropEnum, value: PropValue):
	_data[key.key] = value
