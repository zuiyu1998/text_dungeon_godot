extends StatsEffect

# 用于结算此次战斗
class_name BattleEffct

# 战斗数据
var battle_result: BattleSystem.BattleResult
# 判断是否攻击者
var is_active: bool = false

func update(state: StatsState) -> void:
	if battle_result.is_hit:
		state.memory.health -= battle_result.damage_result.damge
		pass
