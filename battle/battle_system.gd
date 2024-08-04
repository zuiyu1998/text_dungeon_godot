extends RefCounted
class_name BattleSystem

var items: Array[BattleItem] = []

var active_item_index = 0

func _init(stats_list: Array[Stats]) -> void:
	items = BattleSystem.get_batting_first(stats_list)

static func get_batting_first(_stats_list: Array[Stats]) -> Array[BattleItem]:
	var tmp_items = _stats_list.map(
		func(ele: Stats):
			var item = BattleItem.new()
			item.options = BattleOptions.new()
			item.options.from_stats(ele)
			item.source = ele
	)
	tmp_items.sort_custom(
		func(a: BattleSystem.BattleItem, b: BattleSystem.BattleItem):
			return a.options.battting_first > b.options.battting_first
	)
	return tmp_items


func battle():
	
	pass


class BattleItem:
	var options: BattleOptions
	var source: Stats
