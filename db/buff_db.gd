class_name BufferDb

const DEFAULT = preload ('res://assets/character/buffer/default.buffer.csv')

var _data: Dictionary

func _init():
	for record in DEFAULT.records:
		var model = BufferModel.new()
		var id = int(record["id"])
		model.id = id
		model.buffer_name = record["buffer_name"]
		model.description = record["description"]

		_data[id] = model

func get_id(id: int) -> BufferModel:
	return _data[id]

class BufferModel:
	var id: int
	var buffer_name: String
	var description: String
