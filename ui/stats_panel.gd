extends CanvasLayer
class_name StatsPanel

@export
var stats: Stats

@onready var v_box_container: VBoxContainer = $MainContainer/VBoxContainer

var prop_label = preload("res://ui/prop_label.tscn")

var props = ["power", "agile", "intelligence", "perception", "charm", "constitution"]

var data := {
}

var prop_labels: Dictionary = {}

func spawn_labels():
	for prop in props:
		var prop_label_instance: PropLabel = prop_label.instantiate()
		prop_labels[prop] = prop_label_instance
		
		v_box_container.add_child(prop_label_instance)

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
	spawn_labels()
	update_stats_panel()
	stats.stats_update.connect(update_stats_panel)

func update_stats_panel():
	from_stats()
	for prop in props:
		var prop_label_instance: PropLabel = prop_labels[prop]
		if prop_label_instance:
			var label_data = PropLabel.PropLabelData.new()
			label_data.label = prop
			label_data.value = str(data[prop])
			prop_label_instance.update_label(label_data)

pass
