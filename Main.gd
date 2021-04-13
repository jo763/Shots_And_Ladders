extends Node2D

const pathUnit = 1
const unitFraction = 0.0417
var pos1 = 0
var pos2 = 0
var pos3 = 0
var pos4 = 0
var randNum

# Called when the node enters the scene tree for the first time.
func _ready():
	$PlayerPath_1/Path_1.unit_offset = 0
	$PlayerPath_2/Path_2.unit_offset = 0
	$PlayerPath_3/Path_3.unit_offset = 0
	$PlayerPath_4/Path_4.unit_offset = 0
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func abnormalMove(player, position):
	if position == 3 * pathUnit:
		position = float(5 * pathUnit)
	elif position == 10 * pathUnit:
		position = float(16 * pathUnit)
	elif position == 11 * pathUnit:
		position = float(7 * pathUnit)
	elif position == 15 * pathUnit:
		position = float(1 * pathUnit)
	elif position == 23 * pathUnit:
		position = float(16 * pathUnit)
	return position
	pass

func diceRoll():
	randomize()
	randNum = randi()%3+1
	return pathUnit * randNum
	pass

func playerMove(player, playerPos):
	playerPos +=  diceRoll()
#	player.unit_offset = playerPos * unitFraction
#	playerPos = abnormalMove(player, playerPos)
#	yield(get_tree().create_timer(0.3), "timeout")
#	player.unit_offset = playerPos * unitFraction
#	print('x')
	pass

func _on_SpinbuttonGreen_pressed():
#	playerMove($PlayerPath_1/Path_1, pos1)
	pos1 +=  diceRoll()
	$PlayerPath_1/Path_1.unit_offset = pos1 * unitFraction
	pos1 = abnormalMove($PlayerPath_1/Path_1, pos1)
	yield(get_tree().create_timer(0.3), "timeout")
	$PlayerPath_1/Path_1.unit_offset = pos1 * unitFraction
	pass


func _on_SpinbuttonRed_pressed():
	pos2 +=  diceRoll()
	$PlayerPath_2/Path_2.unit_offset = pos2 * unitFraction
	pos2 = abnormalMove($PlayerPath_2/Path_2, pos2)
	yield(get_tree().create_timer(0.3), "timeout")
	$PlayerPath_2/Path_2.unit_offset = pos2 * unitFraction
	pass


func _on_SpinbuttonBlue_pressed():
	pos3 +=  diceRoll()
	$PlayerPath_3/Path_3.unit_offset = pos3 * unitFraction
	pos3 = abnormalMove($PlayerPath_3/Path_3, pos3)
	yield(get_tree().create_timer(0.3), "timeout")
	$PlayerPath_3/Path_3.unit_offset = pos3 * unitFraction
	pass


func _on_SpinbuttonYellow_pressed():
	pos4 +=  diceRoll()
	$PlayerPath_4/Path_4.unit_offset = pos4 * unitFraction
	pos4 = abnormalMove($PlayerPath_4/Path_4, pos4)
	yield(get_tree().create_timer(0.3), "timeout")
	$PlayerPath_4/Path_4.unit_offset = pos4 * unitFraction
	pass


func _on_ResetButton_pressed():
	get_tree().reload_current_scene()
