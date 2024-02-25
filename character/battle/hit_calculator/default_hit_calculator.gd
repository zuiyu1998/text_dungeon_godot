extends HitCalculator

func get_hit_result(active: Props, unactive: Props) -> HitResult:
	var res = HitResult.new()
	
	var prop_enum := get_hit_prop_enum()
	var default_hit = active.get_prop(prop_enum).get_value()
		
	print("default hit: ",default_hit)
	
	return res

