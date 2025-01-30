extends ColorRect

var time_passed: float = 0.0

func _process(delta: float) -> void:
	if material.get_shader_parameter("is_triggered"):
		time_passed += delta
		material.set_shader_parameter("time_passed", time_passed)
		material.set_shader_parameter("time_passed_reset", 3.0)
