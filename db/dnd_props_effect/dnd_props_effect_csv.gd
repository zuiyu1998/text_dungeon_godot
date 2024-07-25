extends DndPropsEffectInterface
class_name DndPropsEffectCsv

var csv := [
	preload("res://assets/csv/dnd_props_effec/dnd_props_effect.csv")
]

var csv_data: Dictionary = {}

func _init() -> void:
	for id in csv.size():
		_load_csv(id)

func _load_csv(id: int):
	var data = csv[id]
	
	var dic = {}

	for record in data.records.slice(1, data.records.size()):
		var effect = DndPropEffect.new()
		effect.from_prop = str(record[0])
		effect.to_prop = str(record[1])
		effect.value_rate = float(record[2])
		effect.max_value_rate = float(record[3])
		effect.min_value_rate = float(record[4])
		dic[effect.get_key()] = effect

	csv_data[id] = dic
	

func get_dnd_props_effect(id: int) -> Dictionary:
	return csv_data[id]
