class_name PropEnum

var key: StringName

static func get_prop_enum(raw: String) -> PropEnum:
	var prop_enum = Unknow.new() as PropEnum
	match raw:
		"Agile":
			prop_enum = Agile.new() as PropEnum
		"Armor":
			prop_enum = Armor.new() as PropEnum
		"Burden":
			prop_enum = Burden.new() as PropEnum
		"Charm":
			prop_enum = Charm.new() as PropEnum
		"Constitution":
			prop_enum = Constitution.new() as PropEnum
		"Defense":
			prop_enum = Defense.new() as PropEnum
		"Dodge":
			prop_enum = Dodge.new() as PropEnum
		"HealthMax":
			prop_enum = HealthMax.new() as PropEnum
		"Initiative":
			prop_enum = Initiative.new() as PropEnum
		"Intelligence":
			prop_enum = Intelligence.new() as PropEnum
		"MagicHit":
			prop_enum = MagicHit.new() as PropEnum
		"Parrying":
			prop_enum = Parrying.new() as PropEnum
		"Perception":
			prop_enum = Perception.new() as PropEnum
		"PhysicalHit":
			prop_enum = PhysicalHit.new() as PropEnum
		"Power":
			prop_enum = Power.new() as PropEnum
		"Thump":
			prop_enum = Thump.new() as PropEnum
		"ThumpRate":
			prop_enum = ThumpRate.new() as PropEnum
		"ThumpRateDefault":
			prop_enum = ThumpRateDefault.new() as PropEnum
	return prop_enum
