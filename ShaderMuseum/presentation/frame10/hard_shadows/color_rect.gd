extends ColorRect

func _process(_delta):
	material.set_shader_parameter("mouse_position", get_viewport().get_mouse_position());
	material.set_shader_parameter("screen_size", get_viewport_rect().size)
