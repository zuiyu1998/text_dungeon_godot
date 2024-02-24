class_name Props

var data: Dictionary
# 先攻id
var initiative_id: int = 0
# 攻击类型
var battle_enum: BattleEnum.Battle = BattleEnum.Battle.Slash
# 攻击类型转换器id
var battle_id: int = 0

func get_prop(key: PropEnum) -> PropValue:
	return data[key.key]

func set_prop(key: PropEnum, value: PropValue):
	data[key.key] = value

