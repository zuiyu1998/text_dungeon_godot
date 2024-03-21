class_name CharacterPropsDb

const DEFAULT = preload ("res://assets/character/props/default.character_props_asset.csv")

const PROPS_VALUES_ASSET = {
	"default": preload ("res://assets/character/props/default.character_prop_values_asset.csv")
}

const DICES_ASSET = {
	"default": preload ("res://assets/character/props/default.character_dices_asset.csv")
}

var _data: Dictionary

func _init() -> void:
	for record in DEFAULT.records:
		var model = CharacterPropsModel.new()
		var id = int(record["id"])
		model.id = id
		model.initiative_id = int(record["initiative_id"])
		
		var prop_value_records = PROPS_VALUES_ASSET[record["prop_values_asset_name"]].records
		for prop_value_record in prop_value_records:
			var prop_value_model = CharacterPropValueModel.new()
			prop_value_model.prop_enum = prop_value_record["prop_enum"]
			prop_value_model.max_value = float(prop_value_record["max"])
			prop_value_model.value = float(prop_value_record["value"])
			
			model.prop_values.push_back(prop_value_model)
		_data[id] = model

		var dice_records = DICES_ASSET[record["dices_asset_name"]].records
		for dice_record in dice_records:
			var dice_model = CharacterDiceModel.new()
			dice_model.prop_enum = dice_record["prop_enum"]
			dice_model.trend = int(dice_record["trend"])
			dice_model.max_number = int(dice_record["max_number"])
			
			model.dices.push_back(dice_model)
		_data[id] = model
	pass

func get_id(id: int) -> CharacterPropsModel:
	return _data[id]

class CharacterDiceModel:
	var prop_enum: String
	var trend: int
	var max_number: int

class CharacterPropValueModel:
	var prop_enum: String
	var max_value: float
	var value: float

class CharacterPropsModel:
	var id: int
	var initiative_id: int
	var prop_values: Array[CharacterPropValueModel] = []
	var dices: Array[CharacterDiceModel] = []
