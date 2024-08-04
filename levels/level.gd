extends Node2D

@onready var enemy: Enemy = $Enemy


func on_attack() -> void:
	print("attack start")
	pass

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		on_attack()

