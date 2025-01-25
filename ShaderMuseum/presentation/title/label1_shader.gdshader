shader_type canvas_item;

uniform vec2 fill_tex_offset = vec2(0.0);
uniform vec2 fill_tex_scale = vec2(1.0);
uniform sampler2D fill_tex;
uniform vec4 base_color : source_color = vec4(1.0, 1.0, 0.0, 1.0);
uniform vec4 fill_brighten_color : source_color = vec4(0.0, 0.0, 1.0, 0.2);
uniform float cutoff : hint_range(0.0, 1.0) = 0.5;
uniform vec4 outline_color : source_color = vec4(1.0, 0.0, 0.0, 1.0);
uniform float outline_thickness : hint_range(0.0, 5.0) = 1.0;

void vertex() {
    VERTEX.y += 50.0 * sin(TIME * 0.001 * VERTEX.x);
}

void fragment() {
    // Base texture sampling
    vec4 fill_tex_color = texture(fill_tex, (UV + fill_tex_offset) * fill_tex_scale);
    vec4 not_working_tex_color = texture(TEXTURE, UV);
    vec4 own_texture_color = vec4(COLOR.rgb, not_working_tex_color.a); // Workaround for DynamicFonts
    float own_texture_color_cutoff = step(own_texture_color.r, cutoff);

    // Colored fill
    vec4 colored_fill = vec4(own_texture_color.rgb * fill_tex_color.a * base_color.rgb, own_texture_color.a);
    vec4 new_colored_fill = vec4(mix(colored_fill.rgb, fill_brighten_color.rgb, fill_brighten_color.a), colored_fill.a);
    vec3 merged_color = mix(colored_fill.rgb + new_colored_fill.rgb, outline_color.rgb, own_texture_color_cutoff);

    // Outline effect
    float alpha = own_texture_color.a;
    float outline = 0.0;

    // Sample surrounding pixels for outline
    for (int x = -1; x <= 1; x++) {
        for (int y = -1; y <= 1; y++) {
            if (x != 0 || y != 0) {
                vec2 offset = vec2(float(x), float(y)) * outline_thickness / SCREEN_PIXEL_SIZE;
                vec4 neighbor_color = texture(TEXTURE, UV + offset);
                outline = max(outline, neighbor_color.a);
            }
        }
    }

    // Combine outline and base color
    vec4 final_outline_color = vec4(outline_color.rgb, outline * (1.0 - alpha));
    COLOR = mix(vec4(merged_color, colored_fill.a), final_outline_color, outline);
}
