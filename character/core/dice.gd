class_name Dice

var trend: Trend = Trend.Normal
var max_number: int = 20

enum Trend { Normal, Advanced, Disadvanced }

func get_dice_rusult() -> DiceResult:
	var res = DiceResult.new()
	var rand = RandomNumberGenerator.new()
	
	res.trend = trend
	res.max_number = max_number

	var first = rand.randi_range(1, max_number + 1)	
	match trend:
		Trend.Normal:
			res.value = first
		Trend.Advanced:
			var second = rand.randi_range(1, max_number + 1)	
			res.first = first
			res.second = second
			res.value = maxi(first, second)
		Trend.Disadvanced:
			var second = rand.randi_range(1, max_number + 1)	
			res.first = first
			res.second = second
			res.value = maxi(first, second)
	
	return res

class DiceResult:
	var value: int
	var first: int
	var second: int
	var trend: Trend
	var max_number: int
