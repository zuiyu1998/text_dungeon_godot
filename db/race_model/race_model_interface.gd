extends RefCounted
class_name RaceModelInterface

func get_race_model(_id: int) -> Race.RaceModel:
	return Race.RaceModel.new()
