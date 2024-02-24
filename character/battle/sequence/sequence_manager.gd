class_name SequenceManager

# 参与战斗的玩家们
var character_list: Array[Character]
# 玩家对应的先攻计算器
var sequece_list: Array[Sequence]
# 当前行动的玩家
var sequence_index = 0

func next():
	sequence_index += 1
	sequence_index %= character_list.size()

func get_current_character() -> Character:
	return character_list[sequence_index]

# 获取另一个角色，只有两个的时候
func get_unactive_character() -> Character:
	var index = (sequence_index + 1 ) % character_list.size()
	return character_list[index]

func _sort_by(a: Sequence, b:Sequence):
	return a.sequnce >= b.sequnce

func set_character_list(list: Array[Character]):
	character_list = list	
	sequece_list = []
	for index in range(0,character_list.size()):
		var sequence = SequenceFactory.get_sequence(character_list[index].props.initiative_id)
		sequence.character_index = index
		sequence.from_character(character_list[index])
		sequece_list.push_back(sequence)
	
	sequece_list.sort_custom(_sort_by)
