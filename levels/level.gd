extends Node2D

@onready var enemy: Enemy = $Enemy

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		print("[states health: %s, max_health: %s]" % [enemy.stats.data.health,enemy.stats.data.max_health])

