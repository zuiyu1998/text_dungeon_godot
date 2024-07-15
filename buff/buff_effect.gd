extends RefCounted
class_name BuffEffct

var effects: Array[StatsEffect] = []


func on_enter(stats: Stats) -> void:
	print("[buff effect enterd]")
	stats.add_effects(effects)

func on_remove(stats: Stats) -> void:
	print("[buff effect removed]")
	stats.remove_effects(effects)
