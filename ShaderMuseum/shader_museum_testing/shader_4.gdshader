shader_type canvas_item;

uniform float influence: hint_range(0.0, 1.0, 0.01) = 0.2;

const float TWO_PI = 6.28318530718;

group_uniforms Sine;
uniform bool do_abs;
uniform bool do_quantize;
uniform float quantize_to : hint_range(0, 2, 0.1) = 1;
uniform vec2 sine_amplitude = vec2(1.0, 0.0);
uniform vec2 sine_speed = vec2(1.0, 0.0);

void vertex() {
	vec2 s = sin(TIME * sine_speed);
	s.x = sin(TIME * 2.0);
	if (do_abs) {
		s = abs(s);
	}
	VERTEX += s * sine_amplitude;
	if (do_quantize) {
		VERTEX = round(VERTEX / quantize_to);
		VERTEX *= quantize_to;
	}
}

vec3 hsv2rgb(vec3 _c) {
    vec4 _K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
    vec3 _p = abs(fract(_c.xxx + _K.xyz) * 6.0 - _K.www);
    return _c.z * mix(_K.xxx, clamp(_p - _K.xxx, 0.0, 1.0), _c.y);
}

void fragment() {
    vec2 pos = vec2(0.0) - UV;
    pos += vec2(1, 1) - UV;

    // Intensify the spinning by increasing the multiplier
    float dynamic_offset = SCREEN_UV.y * 500.0; // Amplified from 50.0 to 500.0

    COLOR.rgb += influence * hsv2rgb(vec3(((atan(pos.y, pos.x) + radians(dynamic_offset)) / TWO_PI) + 0.5, length(pos) * 5.0, 1.0) * 1.0);
}
