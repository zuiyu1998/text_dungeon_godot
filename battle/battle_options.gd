extends RefCounted
class_name BattleOptions

# 先攻
var battting_first: int = 0

# 闪避
var dodge_num: int = 0

# 命中
var hit_num: int = 0

func from_stats(stats: Stats) -> void:
	battting_first = stats.storage.dnd_props.get_prop("battting_first").get_value()
	dodge_num = stats.storage.dnd_props.get_prop("dodge").get_value()
	hit_num = stats.storage.dnd_props.get_prop("physical_hit").get_value()
