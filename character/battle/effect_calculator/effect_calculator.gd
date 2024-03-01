class_name EffectCalculator

static func effct(character: Character, result: Battle.BattleResult):
	var effcts = BattleEffectFactory.get_effct_list(character.props.effect_ids)
    
	for effct_instance in effcts:
		effct_instance.effct(character, result)
