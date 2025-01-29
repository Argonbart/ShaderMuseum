extends ColorRect

func _process(_delta):
	var shader = material
	shader.set_shader_parameter("color_rect_size", size)
	shader.set_shader_parameter("screen_size", get_viewport_rect().size)
	shader.set_shader_parameter("mouse_pos", get_local_mouse_position())
	shader.set_shader_parameter("point_a", Vector2(200.0, 600.0))
	shader.set_shader_parameter("point_b", Vector2(1100.0, 600.0))
	shader.set_shader_parameter("factor", 100.0)
