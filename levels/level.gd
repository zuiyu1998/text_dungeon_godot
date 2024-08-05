extends Node2D

@onready var player: Player = $Player
@onready var enemy: Enemy = $Enemy


func on_attack() -> void:
	print("attack start")
	var battle_system = BattleSystem.new([player.stats, enemy.stats])
	battle_system.battle()
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		on_attack()

