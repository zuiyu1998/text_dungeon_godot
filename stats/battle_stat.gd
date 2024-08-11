class_name BattleStat

# 基础伤害
var base_damage: int = 0

var weapon_damage: int = 0

func from_dnd_props(dnd_props: DndProps):
	base_damage = floori(((dnd_props.get_prop("power").get_value() - 10) / 2.0))
	pass

func to_dict() -> Dictionary:
	return {
		base_damage = base_damage,
		weapon_damage = weapon_damage
	}
	
func from_dict(dict: Dictionary) -> void:
	weapon_damage = dict.weapon_damage
	base_damage = dict.base_damage
