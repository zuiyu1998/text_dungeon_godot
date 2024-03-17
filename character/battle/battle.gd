class_name Battle

var damage_enum: DamageEnum.Damage

func start(active_character: Character, unactive_character: Character):

	var battle_res = BattleResult.new()

	var active = active_character.get_instance();
	var unactive = unactive_character.get_instance();
	# 获取伤害类型
	var converter := DamageBattleConverterFactory.get_converter(active.props.battle_id)
	damage_enum = converter.into_damge(active.props.battle_enum)
	
	var hit_calculator = HitCalculatorFactory.get_id(active.props.hit_calculator_id)
	hit_calculator.from_characters(active, unactive)
	hit_calculator.set_damage(damage_enum)
	var hit_res = hit_calculator.get_hit_result()

	if hit_res.is_hit:
		var thump_calculator := ThumpCalculatorFactory.get_id(active.props.thump_calculator_id)
		thump_calculator.from_characters(active, unactive)
		thump_calculator.set_damage(damage_enum)

		var thump_res := thump_calculator.get_thump_result()
		battle_res.thump_result = thump_res

	battle_res.damage_enum = damage_enum
	battle_res.hit_result = hit_res

	battle_res.is_active = false
	EffectCalculator.effct(unactive_character, battle_res)

	battle_res.is_active = true
	EffectCalculator.effct(active_character, battle_res)

class BattleResult:
	var is_active: bool = false
	var hit_result: HitCalculator.HitResult
	var thump_result: ThumpCalculator.ThumpResult
	var damage_enum: DamageEnum.Damage
