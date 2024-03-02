class_name CharacterState

var helath_dice := Dice.new()

# 血量上限
var health_max := 0
# 血量
var health := 0

# 人物存活
var dead := false

func from_props(props: CharacterProps):
    helath_dice.max_number = props.get_prop(HealthMax.new()).get_value()

    health_max = helath_dice.max_number
    health = health_max
