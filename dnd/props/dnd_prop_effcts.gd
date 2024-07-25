extends RefCounted
class_name DndPropEffects

# 影响的数据
var _effcts:  Dictionary = {} 
# 影响的关系
var _effct_props: Dictionary = {}


# 获取对应的影响列表
func get_effect_list(from: StringName) -> Array[DndPropEffect]:
	var effcted_props = _effct_props[from] as Array[String]
	
	var v = []
	
	if effcted_props != null:
		for to_prop in effcted_props:
			var effect = _effcts[get_key(from, to_prop)]
			v.push_back(effect)
	
	return v


# 是否影响
func has_effct(from: StringName) -> bool:
	if _effct_props[from] != null:
		return true
	else:
		return false

# 得到key，根据影响的属性和被影响的属性
func get_key(from: StringName, to: StringName) -> String:
	return '%s-%s' % [from, to]


func to_dict() -> Dictionary:
	var dict = {}
	
	for effect: DndPropEffect in _effcts.values():
		dict[get_key(effect.from_prop, effect.to_prop)] = effect.to_dict()
	
	return {
		effcts = dict,
		effct_props = _effct_props
	} 


func from_dict(dict: Dictionary):
	for sub_dict in dict.effcts:
		var effect = DndPropEffect.new()
		effect.from_dict(sub_dict)
		_effcts[get_key(effect.from_prop, effect.to_prop)] = effect

	_effct_props = dict.effct_props
