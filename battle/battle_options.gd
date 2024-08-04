extends RefCounted
class_name BattleOptions

# 先攻
var battting_first: int = 0

func from_stats(stats: Stats) -> void:
    battting_first = stats.storage.dnd_props.get_prop("battting_first").get_value()