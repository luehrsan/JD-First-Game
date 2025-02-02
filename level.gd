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
	$Youdied.position = Vector2(1200, 1200)
	Variables.score = 0


func _process(_delta: float) -> void:
	pass

func _on_flag_point():
	Variables.score+= 1
	$Score.text = "Score: " + str(Variables.score)
	index = randi() % points.size()
	Variables.flag_pos = points[index]
	reposition.emit()

var color = Color(0,0,0,1)
var colorR = Color(1,0,0,1)

func _on_enemies_hit() -> void:
	var tween = create_tween()
	tween.tween_property($ColorRect,"color", color, 0.5) 
	$Youdied.position = Vector2(280, 400)
	$RestartTimer.start()
	$Enemies.position = Vector2(1200,1200)
	$Enemies2.position = Vector2(1200,1200)
	$Enemies3.position = Vector2(1200,1200)

func _on_enemies_2_hit() -> void:
	var tween = create_tween()
	tween.tween_property($ColorRect,"color", color, 0.5) 
	$Youdied.position = Vector2(280, 400)
	$RestartTimer.start()
	$Enemies.position = Vector2(1200,1200)
	$Enemies2.position = Vector2(1200,1200)
	$Enemies3.position = Vector2(1200,1200)

func _on_enemies_3_hit() -> void:
	var tween = create_tween()
	tween.tween_property($ColorRect,"color", color, 0.5)
	$Youdied.position = Vector2(280, 400)
	$RestartTimer.start()
	$Enemies.position = Vector2(1200,1200)
	$Enemies2.position = Vector2(1200,1200)
	$Enemies3.position = Vector2(1200,1200)


func _on_restart_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://hud.tscn")
