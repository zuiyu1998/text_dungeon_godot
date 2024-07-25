extends DndPropsDefaultInterface
class_name DndPropsDefaulCsv

var csv := [
	preload ("res://assets/csv/dnd_props_default.csv")
]

var csv_data: Dictionary = {}

func _init() -> void:
	for id in csv.size():
		_load_csv(id)

func _load_csv(id: int):
	var data = csv[id]
	
	var dnd_props := DndProps.new()
	for record in data.records.slice(2, data.records.size()):
		var prop = DndProp.new()
		prop.min_limit = int(record[5])
		prop.max_limit = int(record[4])
		prop.current_min = int(record[3])
		prop.current_max = int(record[2])
		prop.current = int(record[1])
		prop.name = record[0]
		
		dnd_props.add_prop(prop)
	
	csv_data[id] = dnd_props

func get_dnd_props(id: int) -> DndProps:
	var props = DndProps.new()
	var tmp := csv_data[id] as DndProps
	props.from_dict(tmp.to_dict())
	return props
