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
	var dodge_decision_res = get_dodge_decision()
	
	if not dodge_decision_res.success:
		print("hit fail, dodge success")
	pass


func get_dodge_decision() -> DicisionResult:
	var active_item := items[active_item_index]
	var unactive_item := items[unactive_item_index]

	var dodge_decision = Decision.new()
	dodge_decision.base = active_item.options.hit_num
	dodge_decision.dc = unactive_item.options.dodge_num

	var res = dodge_decision.decision()

	return res

func get_hit_result() -> void:
	pass

class BattleItem:
	var options: BattleOptions
	var source: Stats
