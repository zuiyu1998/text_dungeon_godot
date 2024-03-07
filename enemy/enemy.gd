extends Node2D
class_name Enemy
@onready var health: HealthUi = $Sprite2D/Health

var character = Character.new()

func on_damage(damage_info: DamageInfo):
	print(damage_info.damage)
	health.update_percent_value(character.state.get_percent_value())

func _ready():
	await health.ready
	character.damage.connect(on_damage)
	health.value = character.state.get_percent_value()
