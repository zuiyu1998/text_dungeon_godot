class_name HitCalculator

# 伤害类型
var _damage_enum: DamageEnum.Damage
# 命中属性
var _hit_number: int = 0
# 命中骰子
var _hit_dice: Dice = Dice.new()
# 闪避属性
var _dodge_number: int = 0
# 护甲属性
var _armor_number: int = 0

func set_damage(damage_enum: DamageEnum.Damage):
	_damage_enum = damage_enum

func from_characters(active_charater: Character, unactive_character: Character):
	var hit_prop_enum = get_hit_prop_enum()
	_hit_number = active_charater.props.get_prop(hit_prop_enum).get_value()
	_hit_dice.trend = active_charater.props.get_dice_trend(hit_prop_enum)
	_hit_dice.max_number = active_charater.props.get_dice_max(hit_prop_enum)

	_dodge_number = unactive_character.props.get_prop(Dodge.new()).get_value()
	_armor_number = unactive_character.props.get_prop(Armor.new()).get_value()
	pass

# 获取结果
func get_hit_result() -> HitResult:
	var res = HitResult.new()

	var dice_res = _hit_dice.get_dice_rusult()
	var hit_sum = _hit_number + dice_res.value

	if not res.is_hit:
		if hit_sum >= _dodge_number:
			res.is_hit = true
			res.is_dodge = false
		else:
			res.is_dodge = true

	if not res.is_hit:
		if hit_sum >= _armor_number:
			res.is_hit = true
			res.is_armor = false
		else:
			res.is_armor = true

	return res

func get_hit_prop_enum() -> PropEnum:
	match _damage_enum:
		DamageEnum.Damage.Slash:
			return PhysicalHit.new()
	
	return PhysicalHit.new()

class HitResult:
	# 是否命中
	var is_hit: bool = false
	# 是否闪避成功	
	var is_dodge: bool = false
	# 是否防守成功
	var is_armor: bool = false
