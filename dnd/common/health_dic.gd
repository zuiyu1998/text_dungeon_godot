extends RefCounted
class_name HealthDice

var dice := DndDice.new()

func set_health_dice(max_value: int):
    dice.max_value = max_value

func get_health_value(is_first=false):
    if is_first:
        return dice.max_value
    else:
        return dice.get_result().value