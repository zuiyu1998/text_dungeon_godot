extends Node2D
class_name Enemy

@onready var stats: Stats = $Stats
@onready var stats_panel: StatsPanel = $StatsPanel

func on_check() -> void:
	stats_panel.visible = true
	pass
