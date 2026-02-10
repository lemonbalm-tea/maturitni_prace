shader_type canvas_item;
// 'unshaded' is the key: it prevents the ColorRect from being turned black 
// by the CanvasModulate node.
render_mode blend_add, unshaded; 

uniform sampler2D distance_map : filter_nearest;
uniform sampler2D screen_texture : hint_screen_texture;
uniform float pulse_time : hint_range(0.0, 1.1) = 0.0;
uniform vec4 echo_color : source_color = vec4(0.0, 1.0, 1.0, 1.0);

void fragment() {
    float dist = texture(distance_map, UV).r;
    vec4 world_pixel = texture(screen_texture, SCREEN_UV);
    
    // Wave Math
    float thickness = 0.03;
    float tail_length = 0.4; 
    float ring = step(pulse_time - thickness, dist) * step(dist, pulse_time);
    float tail = smoothstep(pulse_time - tail_length, pulse_time, dist) * step(dist, pulse_time);
    
    float mask = max(ring, tail * 0.7);
    if (dist > 0.98) mask = 0.0;

    // THE FIX: 
    // We add a 'base brightness' to the world_pixel so it isn't zero.
    // This allows the texture of the bricks to actually show up in the echo.
    vec3 texture_with_glow = world_pixel.rgb + (echo_color.rgb * 0.1);
    vec3 final_rgb = texture_with_glow * echo_color.rgb * mask * 5.0;

    COLOR = vec4(final_rgb, 1.0);
}