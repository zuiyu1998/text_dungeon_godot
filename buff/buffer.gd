class_name Buff
extends Node

@onready var timer: Timer = $Timer

var stats: Stats

var model: BuffModel = BuffModel.new()

var effect: BuffEffct

func _ready() -> void:
	if model.duration > 0:
		timer.start(model.duration / 1000.0)
		timer.timeout.connect(on_remove)

	effect.on_enter(stats)
	
func on_remove():
	effect.on_remove(stats)
