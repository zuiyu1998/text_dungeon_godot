extends RefCounted
class_name DndProps

# 属性数据
var _props: Dictionary = {}
var _effcts: DndPropEffects = DndPropEffects.new()

func get_prop(prop: StringName) -> DndProp:
	return _props[prop]

func update_prop(prop: StringName, update: float):
	_update_prop(prop, update)
	if _effcts.has_effct(prop):
		var effects := _effcts.get_effect_list(prop)
		for effct in effects:
			var effct_value = effct.value_rate * update
			_update_prop(effct.to_prop, effct_value)
			var effct_max_value = effct.max_value_rate * update
			_update_max_prop(effct.to_prop, effct_max_value)
			var effct_min_value = effct.min_value_rate * update
			_update_min_prop(effct.to_prop, effct_min_value)

func _update_prop(prop: StringName, update: float):
	var prop_data = _props[prop] as DndProp
	if prop_data != null:
		prop_data.current += update

func _update_max_prop(prop: StringName, update: float):
	var prop_data = _props[prop] as DndProp
	if prop_data != null:
		prop_data.current_max += update

func _update_min_prop(prop: StringName, update: float):
	var prop_data = _props[prop] as DndProp
	if prop_data != null:
		prop_data.current_min += update

# 添加属性
func add_prop(prop: DndProp):
	_props[prop.name] = prop

func to_dict() -> Dictionary:
	var dict = []
	for prop: DndProp in _props.values():
		dict.push_back(prop.to_dict())
	
	return {
		props = dict,
		effects = _effcts.to_dict()
	}

func from_dict(dict: Dictionary) -> void:
	for sub_dict: Dictionary in dict.props:
		var prop = DndProp.new()
		prop.from_dict(sub_dict)
		add_prop(prop)
		
	_effcts.from_dict(dict.effects)
