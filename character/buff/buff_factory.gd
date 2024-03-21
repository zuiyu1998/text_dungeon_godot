class_name BuffFactory

const BUFF_LIST = [
	preload ("res://character/buff/start_buf.gd")
]

static func get_buff(buf_id: int) -> Buffer:
	var script = BUFF_LIST[buf_id] as Script
	var buffer = script.new(buf_id) as Buffer
	return buffer

static func get_buffs(buff_ids: Array) -> Array:
	var buffs = buff_ids.map(BuffFactory.get_buff)
	return buffs

static func update_instance(instance: CharacterInstance):
	var buffers := get_buffs(instance.props.buf_ids)
	for buffer in buffers:
		buffer.update_charactor_instance(instance)
