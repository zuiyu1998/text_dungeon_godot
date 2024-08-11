extends GutTest

func test_battle_system():
	var test_a = Stats.new()
	test_a.storage.update_prop("physical_hit", 10)
	test_a.storage.update_prop("battting_first", 10)
	test_a.storage.update_prop("power", 10)
	
	var test_b = Stats.new()
	
	var battle_system = BattleSystem.new([test_a, test_b])
	var res = battle_system.get_battle_result()
	
	assert_eq(true, res.is_hit, "hit fail")
	assert_eq(5, res.damage_result.damge, "damage computed fail")
