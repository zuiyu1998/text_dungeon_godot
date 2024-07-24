extends RaceModelInterface
class_name RaceModelCsv

var csv := preload ("res://assets/csv/race_model.csv")

var csv_data: Dictionary = {}

func _init() -> void:
	
	var keys = csv.records[1] as Array[String]
	for record in csv.records.slice(2, csv.records.size()):
		var tmp = {}
		for index in range(0, record.size()):
			tmp[keys[index]] = record[index]
		csv_data[int(tmp["id"])] = tmp

func get_race_model(id: int) -> Race.RaceModel:
	var dict = csv_data[id]
	var race_model := Race.RaceModel.new()
	race_model.health_dice = int(dict["health_dice"])
	race_model.race_name = dict["race_name"]
	race_model.race_second_name = dict["race_second_name"]
	
	return race_model
