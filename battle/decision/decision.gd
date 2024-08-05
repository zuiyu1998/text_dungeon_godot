extends RefCounted
class_name Decision

# 本次判定的难度
var dc: int = 0

# 本次判定的基础数值
var base: int = 0

var factors: Array[DecisionFactor] = []

func decision() -> DicisionResult:
	var res = DicisionResult.new()
	var decision_factor_results: Array[DecisionFactor.DecisionFactorResult]= []
	var factor_sum = 0
	for factor in factors:
		var factor_res = factor.get_result()
		decision_factor_results.push_back(factor_res)
		factor_sum += factor_res.value
	
	var target_dc = base + factor_sum
	
	if target_dc >= dc:
		res.success = true
	else:
		res.success = false
	
	res.base = base
	res.dc = dc
	res.target_dc = target_dc
	res.decision_factor_results = decision_factor_results
	return res
