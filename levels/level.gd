extends Node2D

@onready var stats: Stats = $Stats

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		stats.flush_state()
		print(stats.memory.health)

