extends Node2D
class_name Enemy
@onready var health: HealthUi = $Sprite2D/Health

var character = Character.new()

func on_damage(_damage_info: DamageInfo):
	health.update_percent_value(character.state.get_percent_value())

func _ready():
	character.damage.connect(on_damage)
	health.value = character.state.get_percent_value()
