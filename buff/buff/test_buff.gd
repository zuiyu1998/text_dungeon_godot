extends Buff

func _init() -> void:
	effect = BuffEffct.new()
	effect.effects = [MaxHealthEffect.new()]
