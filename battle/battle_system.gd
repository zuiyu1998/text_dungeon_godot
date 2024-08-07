extends RefCounted
class_name BattleSystem

var items: Array[BattleItem] = []

var active_item_index: int = 0
var unactive_item_index: int = 1

func _init(stats_list: Array[Stats]) -> void:
	items = BattleSystem.get_batting_first(stats_list)

static func get_batting_first(_stats_list: Array[Stats]) -> Array[BattleItem]:
	var tmp_items := _stats_list.map(
		func(ele: Stats):
			var item = BattleItem.new()
			item.options = BattleOptions.new()
			item.options.from_stats(ele)
			item.source = ele
			return item
	)
	tmp_items.sort_custom(
		func(a: BattleSystem.BattleItem, b: BattleSystem.BattleItem):
			return a.options.battting_first > b.options.battting_first
	)
	
	var tmp: Array[BattleItem] = []
	tmp.assign(tmp_items)
	return tmp


func battle():
	var res = get_battle_result()


func get_battle_result() -> BattleResult:
	var res = BattleResult.new()
	
	var dodge_decision_res = get_dodge_decision()
	res.dodge_decision_result = dodge_decision_res
	
	if not dodge_decision_res.success:
		print("hit fail, dodge success")
	
		var armor_decision_res = get_armor_decision()
		res.armor_decision_result = armor_decision_res
		
		if not armor_decision_res.success:
			print("hit fail, battle fail")
			return res

	var damage_res = get_damage()

	res.damage_result = damage_res

	
	return res

func get_damage() -> DamageResult:
	var active_item := items[active_item_index]
	return active_item.options.damge_info.get_damage_result()


func get_armor_decision() -> DicisionResult:
	var active_item := items[active_item_index]
	var unactive_item := items[unactive_item_index]

	var decision = Decision.new()
	decision.base = active_item.options.physical_hit_num
	decision.dc = unactive_item.options.dodge_num

	var res = decision.decision()

	return res


func get_dodge_decision() -> DicisionResult:
	var active_item := items[active_item_index]
	var unactive_item := items[unactive_item_index]

	var dodge_decision = Decision.new()
	dodge_decision.base = active_item.options.physical_hit_num
	dodge_decision.dc = unactive_item.options.dodge_num

	var res = dodge_decision.decision()

	return res

func get_hit_result() -> void:
	pass

class BattleItem:
	var options: BattleOptions
	var source: Stats

class BattleResult:
	var dodge_decision_result: DicisionResult
	var armor_decision_result: DicisionResult
	var damage_result: DamageResult
