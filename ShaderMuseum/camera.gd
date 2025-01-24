extends Camera2D

@export var player: CharacterBody2D
@export var move_speed: float = 5.0

func _process(delta):
	position.x = lerp(position.x, player.position.x, delta * move_speed)
