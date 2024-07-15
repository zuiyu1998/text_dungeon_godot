class_name TestEffect
extends StatsEffect

func update(state: StatsState) -> void:
	state.memory.health -= 1
