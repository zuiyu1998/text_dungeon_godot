class_name Battle

var damage_enum: DamageEnum.Damage

func from_character(active: Character, unactive: Character):
	# 获取伤害类型
	var converter := DamageBattleConverterFactory.get_converter(active.props.battle_id)
	damage_enum = converter.into_damge(active.props.battle_enum)
	
	print(damage_enum)
	
	pass
