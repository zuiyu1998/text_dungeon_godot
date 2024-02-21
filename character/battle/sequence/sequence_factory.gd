class_name SequenceFactory

const sequence_list = [
	preload("res://character/battle/sequence/default_sequence.gd")
]

static func get_sequence(id: int) -> Sequence:
	var script = sequence_list[id] as Script
	var sequence = script.new() as Sequence
	return sequence
