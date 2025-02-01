extends CharacterBody2D
var speed: int = 200
var direction: Vector2 = Vector2.ZERO
func _on_ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	Variables.player_pos = position


func _on_enemies_hit() -> void:
	print("Player died")
