extends Node2D
class_name Enemy

signal battle(enemy)

@onready var stats: Stats = $Stats
@onready var stats_panel: StatsPanel = $StatsPanel
@onready var sprite_2d: Sprite2D = $Sprite2D

func _unhandled_input(event: InputEvent) -> void:
	var mouse_positon = get_global_mouse_position()
	var rect = Rect2(global_position, sprite_2d.get_rect().size)
	if rect.has_point(mouse_positon):
		if event.is_action_pressed("attack"):
				print("on attack ", name)
				battle.emit(self)
		
		if event.is_action_pressed("check"):
			on_check()	

func on_check() -> void:
	stats_panel.visible = true
	pass
