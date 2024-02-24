class_name BattleSystem

var sequence_manager: SequenceManager = SequenceManager.new()

func _init(player: Character, enemy: Character) -> void:
	sequence_manager.set_character_list([player, enemy])

func get_battle() -> Battle:
	var battle = Battle.new()
	var active = sequence_manager.get_current_character()
	var unactive = sequence_manager.get_unactive_character()
	battle.from_character(active, unactive)
	
	return battle
