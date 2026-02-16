shader_type canvas_item;
render_mode unshaded, blend_mix;

// --- INPUTS ---
uniform sampler2D distance_map : filter_nearest;
uniform sampler2D hidden_texture : filter_linear;
uniform float pulse_time : hint_range(0.0, 1.5) = 0.0;
uniform vec4 echo_color : source_color = vec4(0.0, 1.0, 1.0, 1.0);

// --- SETTINGS ---
// Controls the width of the bright ring
const float WAVE_THICKNESS = 0.05; 
// Controls how long the trail fades out
const float TRAIL_SIZE = 0.4;

void fragment() {
    // 1. GET DATA
    // Red channel contains the flood-fill distance (0.0 to 1.0)
    float dist = texture(distance_map, UV).r;

    // optimization: skip pixels with no distance data
    if (dist <= 0.001) {
        discard;
    }

    // 2. GET VISUALS
    // We use SCREEN_UV to map the hidden viewport perfectly to the screen
    vec4 visual_color = texture(hidden_texture, SCREEN_UV);

    // 3. CALCULATE WAVE
    // The Ring: Bright leading edge
    float ring = smoothstep(pulse_time - WAVE_THICKNESS, pulse_time, dist);
    ring *= step(dist, pulse_time); // Hard cut at the front

    // The Trail: Fading body behind the ring
    float trail = smoothstep(pulse_time - TRAIL_SIZE, pulse_time, dist);
    trail *= step(dist, pulse_time);

    // Combine: The mask is the brightness of the wave at this pixel
    float mask = max(ring, trail);

    // 4. COLOR COMPOSITION
    // Start with the hidden world texture
    vec3 final_rgb = vec3(1.0, 1.0, 1.0);  // <-- ADD THIS (Force White)

    // Apply the mask (darkness vs light)
    final_rgb *= mask;

    // Add the "Echo" tint (Cyan glow)
    vec3 glow = final_rgb * echo_color.rgb * 3.0;
    final_rgb = mix(final_rgb, glow, 0.8);

    // Output with alpha transparency
    COLOR = vec4(final_rgb, mask);
}