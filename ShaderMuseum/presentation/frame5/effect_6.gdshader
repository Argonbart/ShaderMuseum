shader_type canvas_item;

void fragment() {
	COLOR = vec4(abs(sin(2.0 * TIME)), abs(sin(2.0 * TIME)), abs(sin(2.0 * TIME)), COLOR.a);
}