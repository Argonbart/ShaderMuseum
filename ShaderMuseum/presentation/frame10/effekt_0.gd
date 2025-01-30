extends ColorRect

@export var camera: Camera2D

func _process(_delta):
	material.set_shader_parameter("mouse_position", get_local_mouse_position())
	material.set_shader_parameter("screen_size", get_viewport().size)
