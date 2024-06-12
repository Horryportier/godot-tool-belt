shader_type canvas_item;

uniform bool dither;
uniform int scale;

float dither4x4(vec2 position, float brightness) {
    mat4 dither_table = mat4(
			vec4(0.0625, 0.5625, 0.1875, 0.6875),
            vec4(0.8125, 0.3125, 0.9375, 0.4375),
            vec4(0.2500, 0.7500, 0.1250, 0.6250),
            vec4(1.0000, 0.5000, 0.8750, 0.3750));

    ivec2 p = ivec2(mod(position, 4.0));

    float a = step(float(p.x), 3.0);
    float limit = mix(0.0, dither_table[p.y][p.x], a);

    return step(limit, brightness);
}

void fragment() {
    float i = 1.0; // inside(uv, vec2(0.0), vec2(1.0));

    if (dither) {
   
    vec4 o = vec4(1.0);

    o.rg = texture(TEXTURE, UV).rg;
    o.b = texture(TEXTURE, UV + vec2(0.001, 0.0005)).b;

    vec3 c = o.rgb * 8.0 * i;

    vec2 f = COLOR.xy / float(scale);

    c.r += dither4x4(f, fract(c.r));
    c.g += dither4x4(f, fract(c.g));
    c.b += dither4x4(f, fract(c.b));

    COLOR = vec4(floor(c) / 8.0, 1.0);
	} else {
		   COLOR = texture(TEXTURE, UV) * i;
	}
}
