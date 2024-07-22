extends RefCounted
class_name Race

# 模型
var model: RaceModel = RaceModel.new()
# 属性
var props: DndProp = DndProp.new()
# 属性影响
var effects: DndPropEffects = DndPropEffects.new()

class RaceModel:
	# 种族名
	var race_name: String
	# 亚种名
	var race_second_name: String
	# 生命骰
	var health_dice: int 
