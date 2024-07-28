extends Node2D
class_name Enemy

@onready var stats: Stats = $Stats
@onready var stats_panel: StatsPanel = $StatsPanel

func on_check() -> void:
	stats_panel.visible = true
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("check"):
		on_check()
	pass
