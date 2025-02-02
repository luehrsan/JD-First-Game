extends Node2D

var score = 0
var points = []
func _ready() -> void:
	for child in $FlagPositions.get_children():
		if child is Marker2D:
			points.append(child.position)
	var index = randi() % points.size()
	Variables.flag_pos = points[index]

func _process(_delta: float) -> void:
	pass

func _on_flag_point():
	print("point")
	score+= 1
	$Score.text = "Score: " + score 
