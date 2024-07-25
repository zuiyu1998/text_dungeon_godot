extends RefCounted
class_name Race

# 模型
var model: RaceModel = RaceModel.new()
# 属性
var props: DndProps = DndProps.new()
# 属性影响
var effects: DndPropEffects = DndPropEffects.new()

func _init(model_id: int, default_props_id: int, effct_props_id: int, effects_id: int) -> void:
	Manager.race_model_db.get_race_model(model_id)
	Manager.dnd_props_db.get_dnd_props(default_props_id)
	effects._effct_props = Manager.dnd_props_effect_props_db.get_dnd_props_effect_props(effct_props_id)
	effects._effcts = Manager.dnd_props_effect_db.get_dnd_props_effect(effects_id)


class RaceModel:
	# 种族名
	var race_name: String
	# 亚种名
	var race_second_name: String
	# 生命骰
	var health_dice: int
