extends CharacterBody2D
var speed: int = 150
var direction: Vector2 = Vector2.ZERO
var ready_track = 0
signal hit
func _ready() -> void:
	$".".position = Vector2(756,948)
	$"../Enemies2".position = Vector2(691,499)
	$"../Enemies3".position = Vector2(750,58)
	if (position == Vector2(756,948)):
		$NavigationAgent2D.target_position = Variables.tracker1_pos
		speed = 150
	elif (position == Vector2(691,499)):
		$NavigationAgent2D.target_position = Variables.tracker2_pos
		speed = 125
	elif (position == Vector2(750,58)):
		$NavigationAgent2D.target_position = Variables.player_pos
		speed = 175


func _physics_process(_delta):
		if (ready_track ==1):
			direction = ($NavigationAgent2D.get_next_path_position() - global_position).normalized()
			velocity = direction * speed
			move_and_slide()



func _on_navigation_timer_timeout() -> void:
	$NavigationAgent2D.target_position = Variables.player_pos
	ready_track = 1


func _on_area_2d_body_entered(_body: Node2D) -> void:
	hit.emit()
