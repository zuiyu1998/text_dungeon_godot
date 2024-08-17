extends Control
class_name StatsPanelShort

@onready var health_bar: TextureProgressBar = $HealthBar

@export
var stats: Stats

func _ready() -> void:
	stats.stats_update.connect(update_health)
	update_health()

func update_health() -> void:
	var percentage := stats.data.health / stats.data.max_health
	health_bar.value = percentage
