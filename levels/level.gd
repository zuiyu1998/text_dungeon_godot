extends Node2D

@onready var stats: Stats = $Stats

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		print("[states health: %s, max_health: %s]" % [stats.memory.health,stats.storage.max_health])

