shader_type canvas_item;

uniform float dis = 0.5;
uniform float width = 0.1;
uniform float blur = 0.1;

vec2 rotate2D(vec2 v, float angle) {
    return vec2(
        v.x * cos(angle) - v.y * sin(angle),
        v.x * sin(angle) + v.y * cos(angle)
    );
}


void fragment() {
    vec2 uv = UV;
    uv -= 0.5;

	vec2 middle = uv / 2.0;
	vec2 middle_to_uv = uv - middle;
	float length_to_uv = length(middle_to_uv);

    vec2 pos = middle;// vec2(0.5 * (SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y), 0.5);
    uv.x *= SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
    uv *= 10.0;
    pos *= 10.0;

    vec3 col = vec3(0.0);
    vec3 lineColor = vec3(sin(2.0*3.14*0.1*TIME), clamp(cos(TIME), 0.2, 0.8), clamp(tan(TIME), 0.0, 0.6));

    // Left top
    //if ((uv.x < uv.x * 0.5) && (uv.y > uv.y * 0.5)) {
        vec2 o = uv + vec2(0.5 * pos.x, -0.5 * pos.y);
        float angle = atan(o.y, o.x);
        float l = length(o);
        float offset = l + (angle / (2.0 * PI)) * dis;
        float circles = mod(offset - TIME, dis);
        col = (smoothstep((circles - blur) * -abs(sin(1.0 * TIME)), circles , width) - smoothstep(circles, (circles + blur), width)) * lineColor;
    //}

    //// Right top
    //if ((uv.x >= uv.x * 0.5) && (uv.y > uv.y * 0.5)) {
        //vec2 o = uv + vec2(-0.5 * pos.x, -0.5 * pos.y);
        //float angle = atan(o.y, o.x);
        //float l = length(o);
        //float offset = abs(o.x) + abs(o.y) + (angle / (2.0 * PI)) * dis;
        //float circles = mod(offset - TIME, dis);
        //col = (smoothstep(circles - blur, circles, width) - smoothstep(circles, circles + blur, width)) * lineColor;
    //}
//
    //// Left bottom
    //if ((uv.x < uv.x * 0.5) && (uv.y < uv.y * 0.5)) {
        //vec2 o = uv + vec2(0.5 * pos.x, 0.5 * pos.y);
        //float angle = atan(o.y, o.x);
        //float l = length(o);
        //float offset = (log(l) + (angle / (2.0 * PI)) * dis);
        //float circles = mod(offset - TIME, dis);
        //col = (smoothstep(circles - blur, circles, width) - smoothstep(circles, circles + blur, width)) * lineColor;
    //}
//
    //// Right bottom
    //if ((uv.x >= uv.x * 0.5) && (uv.y < uv.y * 0.5)) {
        //vec2 o = uv + vec2(-0.5 * pos.x, 0.5 * pos.y);
        //float angle = atan(o.y, o.x);
        //float l = length(o);
        //float offset = (log(l) / log(E * 5.0) + (angle / (2.0 * PI)) * dis);
        //float circles = mod(offset - TIME, dis);
        //col = (smoothstep(circles - blur, circles, width) - smoothstep(circles, circles + blur, width)) * lineColor;
    //}

    float hl = smoothstep(0.01, 0.03, abs(uv.x - uv.x * 0.5));
    float vl = smoothstep(0.01, 0.03, abs(uv.y - uv.y * 0.5));

    //col = mix(vec3(0.0, 0.0, 0.0), col, hl);
    //col = mix(vec3(0.0, 0.0, 0.0), col, vl);

    COLOR = vec4(col, 1.0); //sin(col*TIME)
}
