extends ColorRect

@export var presenter: Node
@export var animation_duration: float = 2.0 # Total time for the animation
var elapsed_time: float = 0.0
var animating: bool = false
var time_passed: float = 0.0

func _ready():
	material.set_shader_parameter("color_rect_size", size)
	material.set_shader_parameter("active_mouse", false)

func _process(delta):
	material.set_shader_parameter("iMouse", get_local_mouse_position())
	if (material.get_shader_parameter("changing_over_time")):
		time_passed += delta
	else:
		time_passed = 0.0
	material.set_shader_parameter("time_passed", time_passed)
	
	if presenter.current_frame == 6 && Input.is_action_just_pressed("click"):
		material.set_shader_parameter("active_mouse", !material.get_shader_parameter("active_mouse"))
	
	if animating:
		elapsed_time += delta
		var t = elapsed_time / animation_duration
		if t >= 1.0:
			t = 1.0
			animating = false
		material.set_shader_parameter("reveal_time", t)

func animate():
	animating = true
	elapsed_time = 0.0
