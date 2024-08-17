extends Node2D
class_name Player

@onready var stats: Stats = $Stats
@onready var stats_panel: StatsPanel = $StatsPanel

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("backpack"):
		stats_panel.visible = true

func _ready() -> void:
	stats._storage_data.update_prop("physical_hit", 10)
	stats._storage_data.update_prop("battting_first", 10)
	stats._storage_data.update_prop("power", 10)
	stats.flush_state()
