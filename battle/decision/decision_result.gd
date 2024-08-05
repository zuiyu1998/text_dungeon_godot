extends RefCounted

class_name DicisionResult

# 是否成功
var success: bool
# 本次判定的难度
var dc: int = 0
# 判断值
var target_dc: int = 0
# 本次判定的基础数值
var base: int = 0
var decision_factor_results: Array[DecisionFactor.DecisionFactorResult] = []
