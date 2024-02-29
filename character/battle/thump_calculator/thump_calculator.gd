class_name ThumpCalculator

# 是否需要区分物理重击和法术重击

# 伤害类型
var _damage_enum: DamageEnum.Damage

var _base_damage: int = 0
var _thump: int = 0
var _defense: int = 0
var _thump_rate: int = 0
var _default_thump_rate: int = 0
var _parrying: int = 0
var _thump_dice: Dice = Dice.new()

func set_damage(damage_enum: DamageEnum.Damage):
	_damage_enum = damage_enum

func from_characters(active_charater: Character, unactive_character: Character):
	var prop_enum = _get_hit_prop_enum()
	_base_damage = active_charater.props.get_damage(prop_enum)
	_thump = active_charater.props.get_prop(Thump.new()).get_value()
	_thump_dice.trend = active_charater.props.get_dice_trend(Thump.new())
	_thump_dice.max_number = active_charater.props.get_dice_max(Thump.new())
	_thump_rate = active_charater.props.get_prop(ThumpRate.new()).get_value()
	_default_thump_rate = active_charater.props.get_prop(ThumpRateDefault.new()).get_value()
	_defense = unactive_character.props.get_prop(Defense.new()).get_value()
	_parrying = unactive_character.props.get_prop(Parrying.new()).get_value()
	pass

func _get_hit_prop_enum() -> PropEnum:
	match _damage_enum:
		DamageEnum.Damage.Slash:
			return PhysicalHit.new()
	
	return PhysicalHit.new()

func get_thump_result() -> ThumpResult:
	var res = ThumpResult.new()
	res.damage_enum = _damage_enum

	var damage = _base_damage

	var dice_reuslt = _thump_dice.get_dice_rusult()
	
	var thump_sum = _thump + dice_reuslt.value

	if thump_sum >= _defense:
		res.is_thump = true

	if res.is_thump:
		res.thump_damage = floori(damage * (_default_thump_rate + _thump_rate) / 100.0)
		damage += res.thump_damage

	if res.damage <= _parrying:
		res.is_parrying = true
		res.parrying_damage = _parrying
		res.damage = 0

	res.damage = damage

	return res

class ThumpResult:
	# 重击是否成功
	var is_thump: bool = false

	# 实际造成的伤害
	var damage: int = 0
	# 伤害类型
	var damage_enum: DamageEnum.Damage
	
	# 重击造成的伤害
	var thump_damage: int = 0
	# 格挡抵消的伤害
	var parrying_damage: int = 0
	# 格挡是否成功
	var is_parrying: bool = false
