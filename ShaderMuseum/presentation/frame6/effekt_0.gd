extends ColorRect

func _ready():
	material.set_shader_parameter("color_rect_size", size)

func _process(_delta):
	material.set_shader_parameter("iMouse", get_local_mouse_position())
