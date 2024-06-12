shader_type canvas_item;

uniform float spreed = 50;
uniform float cut_off = 0.01;
void vertex() {
	// Called for every vertex the material is visible on.
}
float cut(float value, float cut) {
	if (value < cut) {
		return 0.;
	}
	return value;
}

void fragment() {
	vec4 t = texture(TEXTURE, UV);
	COLOR = vec4(t.rgb, cut(sin(UV.y * spreed) + 0.5, cut_off));
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
