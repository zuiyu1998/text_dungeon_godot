extends Node2D
class_name Enemy
@onready var health: HealthUi = $Sprite2D/Health

var character = Character.new()

func on_health():
	health.update_percent_value(character.state.percent_value())

func _init():
	character.health.connect(on_health)
