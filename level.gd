extends Node2D
var index
var score = 0
var points = []
signal reposition
func _ready() -> void:
	for child in $FlagPositions.get_children():
		if child is Marker2D:
			points.append(child.position)
	index = randi() % points.size()
	Variables.flag_pos = points[index]


func _process(_delta: float) -> void:
	pass

func _on_flag_point():
	score+= 1
	$Score.text = "Score: " + str(score)
	index = randi() % points.size()
	Variables.flag_pos = points[index]
	reposition.emit()
