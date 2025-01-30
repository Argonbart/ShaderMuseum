shader_type canvas_item;

uniform bool is_triggered;
uniform bool is_triggered_2;
uniform float move_speed;
uniform float time_passed;
uniform float time_passed_reset;

void vertex() {
	if (is_triggered) {
		VERTEX.y += move_speed * (mod(time_passed, time_passed_reset));
	}
}

void fragment() {
	if (is_triggered_2) {
		COLOR = vec4(1.0, 0.0, 0.0, 1.0);
	}
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
