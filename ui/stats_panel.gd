extends CanvasLayer
class_name StatsPanel

@export
var stats: Stats

# 基础属性
@onready var power: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/VBoxContainer/Power
@onready var agile: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/VBoxContainer/Agile
@onready var intelligence: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/VBoxContainer/Intelligence
@onready var perception: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/VBoxContainer/Perception
@onready var charm: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/VBoxContainer/Charm
@onready var constitution: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/VBoxContainer/Constitution

#派生属性
@onready var battting_first: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer2/BatttingFirst
@onready var dodge: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer2/Dodge
@onready var physical_hit: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer2/PhysicalHit
@onready var magic_hit: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer2/MagicHit
@onready var armor: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer2/Armor
@onready var immunity: PropContainer = $TabContainer/Props/MarginContainer/VBoxContainer2/MarginContainer/VBoxContainer2/Immunity

func input(event: InputEvent) -> void:
	if event.is_action_pressed("back"):
		visible = false

func update():
	if stats == null:
		return
	
	power.prop_value = stats.get_prop("power").get_value()
	agile.prop_value = stats.get_prop("agile").get_value()
	intelligence.prop_value = stats.get_prop("intelligence").get_value()
	perception.prop_value = stats.get_prop("perception").get_value()
	charm.prop_value = stats.get_prop("charm").get_value()
	constitution.prop_value = stats.get_prop("constitution").get_value()
	
	battting_first.prop_value = stats.get_prop("battting_first").get_value()
	dodge.prop_value = stats.get_prop("dodge").get_value()
	physical_hit.prop_value = stats.get_prop("physical_hit").get_value()
	magic_hit.prop_value = stats.get_prop("magic_hit").get_value()
	armor.prop_value = stats.get_prop("armor").get_value()
	immunity.prop_value = stats.get_prop("immunity").get_value()
	
func _process(_delta: float) -> void:
	update()

pass
