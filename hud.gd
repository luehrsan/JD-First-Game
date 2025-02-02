extends Node



func _ready() -> void:
	$Score.text = "Previous score: " + str(Variables.score)	
	if (Variables.score >Variables.highscore):
		Variables.highscore = Variables.score
	$HighScore.text = "Highscore: " + str(Variables.highscore)

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://level.tscn")
