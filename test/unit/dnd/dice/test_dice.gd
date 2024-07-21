extends GutTest

func test_get_dice_result():
	var dice = DndDice.new()

	var value = dice._get_dice_result(20)
	assert_eq(value, DndDice.DiceResultType.Success)

	var value1 = dice._get_dice_result(0)
	assert_eq(value1, DndDice.DiceResultType.Fail)

	dice.success_value = 1
	dice.fail_value = 1

	var value2 = dice._get_dice_result(19)
	assert_eq(value2, DndDice.DiceResultType.Success)

	var value3 = dice._get_dice_result(1)
	assert_eq(value3, DndDice.DiceResultType.Fail)
