class_name Battle

var damage_enum: DamageEnum.Damage

func start(active: Character, unactive: Character):
	# 获取伤害类型
	var converter := DamageBattleConverterFactory.get_converter(active.props.battle_id)
	damage_enum = converter.into_damge(active.props.battle_enum)
	
	print(damage_enum)
	
	var hit_calculator = HitCalculatorFactory.get_id(active.props.hit_calculator_id)
	hit_calculator.set_damage(damage_enum)
	
	var hit_result = hit_calculator.get_hit_result(active.props, unactive.props)
	
	pass
