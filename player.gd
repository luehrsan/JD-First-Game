extends CharacterBody2D
var speed: int = 200
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
