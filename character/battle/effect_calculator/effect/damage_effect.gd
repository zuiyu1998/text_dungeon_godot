extends BattleEffect

func effct(character: Character, result: Battle.BattleResult):
	if result.hit_result.is_hit and not result.is_active:
		var damage_info = DamageInfo.new()
		damage_info.damage = result.thump_result.damage * - 1
		damage_info.is_hit = result.hit_result.is_hit
		damage_info.is_thump = result.thump_result.is_thump

		character.on_damage(damage_info)
