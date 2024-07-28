extends CanvasLayer
class_name StatsPanel

@export
var stats: Stats

@onready var power: Label = $MainContainer/VBoxContainer/HBoxContainer/Power
@onready var power_value: Label = $MainContainer/VBoxContainer/HBoxContainer/PowerValue

var props = ["power"]

var data: = {
}

func from_stats() -> void:
	for prop in props:
		var dnd_prop := stats.storage.dnd_props.get_prop(prop)
		if dnd_prop:
			data[prop] = dnd_prop.current
	pass

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		visible = false

func _ready() -> void:
	update_stats_panel()
	stats.stats_update.connect(update_stats_panel)

func update_stats_panel():
	from_stats()
	power_value.text = str(data["power"])
	pass


