extends DamageBattleConverter

func into_damge(battle: BattleEnum.Battle) -> DamageEnum.Damage:
	match battle:
		BattleEnum.Battle.Slash:
			return DamageEnum.Damage.Slash
	
	return DamageEnum.Damage.Slash
