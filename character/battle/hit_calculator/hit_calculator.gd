class_name HitCalculator

var _damage_enum: DamageEnum.Damage

func set_damage(damage_enum: DamageEnum.Damage):
	_damage_enum = damage_enum

func get_hit_result(_active_props: Props, _unactive_props: Props) -> HitResult:
	var res = HitResult.new()
	return res

func get_hit_prop_enum() -> PropEnum:
	match _damage_enum:
		DamageEnum.Damage.Slash:
			return PhysicalHit.new()
	
	return PhysicalHit.new()


class HitResult:
	# 是否命中
	var is_hit: bool = false
	# 是否闪避成功	
	var is_dodge: bool = false
	# 是否防守成功
	var is_armor: bool = false
