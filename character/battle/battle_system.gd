class_name BattleSystem

var sequence_manager: SequenceManager = SequenceManager.new()

func _init(player: Character, enemy: Character) -> void:
	sequence_manager.set_character_list([player, enemy])

func get_battle():
	sequence_manager.get_current_character()
