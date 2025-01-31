shader_type canvas_item;

uniform vec2 screen_size;
uniform vec2 mouse_position;

void fragment() {

	vec4 light = vec4(0.5, 0.5, 0.5, 1.0);
	vec4 blue = vec4(0.0, 0.0, 1.0, 1.0);
	vec4 black = vec4(0.0, 0.0, 0.0, 1.0);
	vec4 red = vec4(1.0, 0.0, 0.0, 1.0);

	// screen stuff
	vec2 screen_uv = (SCREEN_UV * screen_size) / 1.5;
	vec2 screen_middle = screen_size / 2.0;
	vec2 light_origin = mouse_position / 1.5;

	// vectors
	vec2 uv_to_light_vector = light_origin - screen_uv;
	vec2 uv_to_light_dir = normalize(uv_to_light_vector);
	float uv_to_light_distance = length(uv_to_light_vector);

	vec4 flashlight_color = light;
	if (true) {
		vec2 at = screen_uv_to_sdf(SCREEN_UV);
		float accum = 0.0;
		while (accum < uv_to_light_distance) {
			float d = texture_sdf(at);
			if (d >= uv_to_light_distance) {
				accum += d;
				break;
			}
			if (accum == 0.0 && d < 0.01) {				// inside occluder = dark
				flashlight_color = blue;
				break;
			}
			if (d < 0.01) {								// occluder in the way = dark
				flashlight_color = black;
				break;
			}
			accum += d;
			at += d * uv_to_light_dir;
		}
		if (accum >= uv_to_light_distance) {			// no occluder = light
			flashlight_color = light;
		}
	}
	if (distance(light_origin, screen_uv) < 10.0) {
		flashlight_color = red;
	}
	COLOR = flashlight_color;

}
