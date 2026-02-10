shader_type canvas_item;

uniform sampler2D distance_map : filter_nearest;

void fragment() {
    float dist = texture(distance_map, UV).r;
    
    float alpha = 1.0;
    if (dist > 0.98) {
        alpha = 0.0;
    }
    
    COLOR = vec4(dist, 0.0, 0.0, alpha);
}