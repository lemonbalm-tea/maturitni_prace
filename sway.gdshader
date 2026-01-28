shader_type canvas_item;

void vertex() {
	float sway_amount = 20.0; // 1
float time_multiplier = 4.0; // 2
float sine_wave = sin(TIME * time_multiplier); // 3

if (UV.y < 0.5) { // 4
    VERTEX += vec2(sine_wave * sway_amount, 0); // 5
}
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
