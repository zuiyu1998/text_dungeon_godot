extends Node2D

class_name Level

var player: Player
@onready var enemy_map: Node2D = $EnemyMap

func _ready() -> void:
	player = PlayerState.player
	for enemy in enemy_map.get_children():
		enemy.connect("battle", on_attack)
	pass

func on_attack(enemy: Enemy) -> void:
	print(enemy.name)
	var battle_system = BattleSystem.new([player.stats, enemy.stats])
	battle_system.battle()
