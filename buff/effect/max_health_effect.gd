class_name MaxHealthEffect
extends StatsEffect

var health = 4


func update(state: StatsState) -> void:
	state.storage.max_health += health
