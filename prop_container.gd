@tool
extends HBoxContainer
class_name PropContainer

@onready var label: Label = $Label
@onready var value: Label = $Value

@export
var prop_label: String = "power":
	set(v):
		if not is_node_ready():
			await ready
		prop_label = v
		label.text = tr(v)
		pass

@export
var prop_value: int = 0:
	set(v):
		if not is_node_ready():
			await ready
		value.text = str(v)
		prop_value = v
		pass
