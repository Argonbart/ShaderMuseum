shader_type canvas_item;

uniform float speed = 2.0;
uniform float frequency_y = 5.0;
uniform float frequency_x = 5.0;
uniform float amplitude_y = 50.0;
uniform float amplitude_x = 25.0;
uniform float inclination = 50.0;
uniform float rotation_angle = 0.0; // Angle in degrees to be converted to radians.

float random(float x) {
    return fract(sin(dot(vec2(x, x),
        vec2(12.9898,78.233))) * 43758.5453123);
}

void vertex() {
	vec2[] positions = {vec2(-50.0, 50.0), vec2(50.0, 50.0), vec2(50.0, -50.0), vec2(50.0, 50.0), vec2(-100.0, 100.0), vec2(100.0, 100.0), vec2(100.0, -100.0), vec2(100.0, 100.0)};
	int random_index = int(8.0 * random(sin(0.0000004 * TIME)));
	VERTEX += positions[random_index];
}