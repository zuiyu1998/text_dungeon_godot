class_name CharacterPropsDb

const DEFAULT = preload("res://assets/character/props/default.character_props_asset.csv")

const PROPSVALUESASSET = {
	"default": preload("res://assets/character/props/default.character_prop_values_asset.csv")
}

var _data: Dictionary

func _init() -> void:
	for record in DEFAULT.records:
		var model = CharacterPropsModel.new()
		var id = int(record["id"])
		model.id = id
		model.initiative_id = int(record["initiative_id"])
		
		var prop_value_records = PROPSVALUESASSET[record["prop_values_asset_name"]].records
		for prop_value_record in prop_value_records:
			var prop_value_model = CharacterPropValueModel.new()
			prop_value_model.prop_enum = prop_value_record["prop_enum"]
			prop_value_model.max = float(prop_value_record["max"])
			prop_value_model.value = float(prop_value_record["value"])
			
			model.prop_values.push_back(prop_value_model)		
		
		_data[id] = model
	pass

func get_id(id: int) -> CharacterPropsModel:
	return _data[id]

class CharacterPropValueModel:
	var prop_enum: String
	var max: float
	var value: float

class CharacterPropsModel:
	var id: int
	var initiative_id: int
	var prop_values: Array[CharacterPropValueModel] = []
