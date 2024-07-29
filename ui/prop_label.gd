extends HBoxContainer
class_name PropLabel

@onready var label: Label = $Label
@onready var value: Label = $Value

func update_label(data: PropLabelData):
	label.text = data.label
	value.text = data.value


class PropLabelData:
	var label: String
	var value: String
