class_name BattleEffect

func effct(character: Character, result: Battle.BattleResult):
	if result.hit_result.is_hit and not result.is_active:
		var damage = result.thump_result.damage
		character.update_health(damage * - 1)
