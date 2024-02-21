extends Sequence

func from_character(character: Character):
	var prop = character.props.get_prop(Initiative.new())
	sequnce = prop.get_value()
