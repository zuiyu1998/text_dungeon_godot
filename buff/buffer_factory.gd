extends  RefCounted
class_name BuffFactory

static var list: Array[PackedScene] = [
	preload("res://buff/buff/test_buff.tscn")
]

static func get_buff(id: int) -> Buff:
	var instance = list[id].instantiate() as Buff
	return instance
