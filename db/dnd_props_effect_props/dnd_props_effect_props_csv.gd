extends DndPropsEffectPropsInterface
class_name DndPropsEffectPropsCsv

var csv := [
	preload ("res://assets/csv/dnd_props_effec_props/dnd_props_effec_props.csv")
]

var csv_data: Dictionary = {}

func _init() -> void:
	for id in csv.size():
		_load_csv(id)

func _load_csv(id: int):
	var data = csv[id]
	
	var dic = {}

	var keys = data.records[0]

	for record in data.records.slice(1, data.records.size()):
		var from_props = record[0]

		var to_props = []
		for index in range(1, record.size()):
			var has = int(record[index]) == 1
		
			if has:
				to_props.push_back(str(keys[index]))
	
		if not to_props.is_empty():
			dic[from_props] = to_props

	csv_data[id] = dic

func get_dnd_props_effect_props(id: int) -> Dictionary:

	return csv_data[id]
