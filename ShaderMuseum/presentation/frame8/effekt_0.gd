extends ColorRect

@export var light: ColorRect

func _process(_delta):
	material.set_shader_parameter("light_position", light.get_screen_position() + light.size / 1.35);
	material.set_shader_parameter("mouse_position", get_viewport().get_mouse_position());
	material.set_shader_parameter("screen_size", get_viewport_rect().size)
