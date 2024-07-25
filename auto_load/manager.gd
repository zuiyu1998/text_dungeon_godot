extends Node
class_name IManager

var race_model_db: RaceModelInterface = RaceModelCsv.new()
var dnd_props_db: DndPropsDefaultInterface = DndPropsDefaulCsv.new()
var dnd_props_effect_props_db: DndPropsEffectPropsInterface = DndPropsEffectPropsCsv.new()
var dnd_props_effect_db: DndPropsEffectInterface = DndPropsEffectCsv.new()
