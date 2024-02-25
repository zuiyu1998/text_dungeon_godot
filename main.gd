extends Node2D

@onready var enemy: Enemy = $Enemy
@onready var player: Player = $Player

func on_wheel():
	if Input.is_action_just_pressed("attack"):
		var battle_system = BattleSystem.new(player.character, enemy.character)
		battle_system.start_battle()
		pass
	pass

func _physics_process(delta: float) -> void:
	on_wheel()
