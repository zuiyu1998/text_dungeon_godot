extends CanvasLayer
class_name StatsPanel

@onready var v_box_container: VBoxContainer = $MainContainer/VBoxContainer

func from_stats() -> void:
	pass

func input(event: InputEvent) -> void:
	
	if event.is_action_pressed("back"):
		visible = false

func update_stats_panel():
	from_stats()

pass
