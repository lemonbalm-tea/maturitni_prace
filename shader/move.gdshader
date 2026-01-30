shader_type canvas_item;

void vertex() {
	float speed_multiplier = 2.0; // 1
vec2 movement_vector = vec2(25.0, 0.0); // 2

VERTEX += sin(TIME * speed_multiplier) * movement_vector; // 3
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
