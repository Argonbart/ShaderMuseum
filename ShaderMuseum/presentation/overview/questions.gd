extends Node2D

@export var presenter: Node

func _process(_delta: float) -> void:
	if presenter.current_frame == 0 && Input.is_action_just_pressed("click"):
		visible = !visible
