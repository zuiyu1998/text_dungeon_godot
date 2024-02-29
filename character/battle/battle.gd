class_name Battle

var damage_enum: DamageEnum.Damage

func start(active: Character, unactive: Character):
	# 获取伤害类型
	var converter := DamageBattleConverterFactory.get_converter(active.props.battle_id)
	damage_enum = converter.into_damge(active.props.battle_enum)
	
	print(damage_enum)
	
	var hit_calculator = HitCalculatorFactory.get_id(active.props.hit_calculator_id)
	hit_calculator.from_characters(active, unactive)
	hit_calculator.set_damage(damage_enum)
	var hit_res = hit_calculator.get_hit_result()

	print("hit_res is_hit:", hit_res.is_hit)
	print("hit_res is_dodge:", hit_res.is_dodge)
	print("hit_res is_armor:", hit_res.is_armor)

	if hit_res.is_hit:
		var thump_calculator := ThumpCalculatorFactory.get_id(active.props.thump_calculator_id)
		thump_calculator.from_characters(active, unactive)
		thump_calculator.set_damage(damage_enum)

		var thump_res := thump_calculator.get_thump_result()

		print("thump_res damage:", thump_res.damage)
		print("thump_res is_thump:", thump_res.is_thump)
		print("thump_res is_parrying:", thump_res.is_parrying)

	pass
