extends RefCounted
class_name BattleOptions

# 先攻
var battting_first: int = 0

# 闪避
var dodge_num: int = 0

# 命中
var physical_hit_num: int = 0

# 命中
var magic_hit_num: int = 0

# 护甲
var armor_num: int = 0

# 豁免
var immunity_num: int = 0

# 伤害数据
var damge_info: DamageInfo = DamageInfo.new()

func from_stats(stats: Stats) -> void:
	battting_first = stats.storage.dnd_props.get_prop("battting_first").get_value()
	dodge_num = stats.storage.dnd_props.get_prop("dodge").get_value()
	physical_hit_num = stats.storage.dnd_props.get_prop("physical_hit").get_value()
	magic_hit_num = stats.storage.dnd_props.get_prop("magic_hit").get_value()
	armor_num = stats.storage.dnd_props.get_prop("armor").get_value()
	immunity_num = stats.storage.dnd_props.get_prop("immunity").get_value()
