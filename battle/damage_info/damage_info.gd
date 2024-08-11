extends RefCounted
class_name DamageInfo

var base_damage: int = 0

var factors: Array[DamageFactor] = []

#todo 获取更多的信息
func from_battle_stat(stat: BattleStat):
	base_damage = stat.base_damage

func get_damage_result() -> DamageResult:
	var res = DamageResult.new()

	var damage = base_damage

	var factor_res_list: Array[DamageFactor.DamageFactorResult]  = []

	for factor in factors:
		var factor_res = factor.get_result()
		damage += factor_res.value
		factor_res_list.push_back(factor_res)
	
	res.base_damage = base_damage
	res.damge = damage
	res.damage_factor_results = factor_res_list

	return res
