extends ColorRect

@export var presenter: Node

func _process(_delta):
	material.set_shader_parameter("mouse_position", get_viewport().get_mouse_position());
	material.set_shader_parameter("screen_size", get_viewport_rect().size)
	
	if presenter.current_frame == 10 && Input.is_action_just_pressed("click"):
		material.set_shader_parameter("active_mouse", !material.get_shader_parameter("active_mouse"))
