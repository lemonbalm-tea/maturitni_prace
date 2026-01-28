shader_type canvas_item;
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture
uniform vec2 player_pos; // Pass player position in pixels
uniform float radius;     // Animate this from 0.0 to 1000.0
uniform float width = 50.0; 

void fragment() {
    float dist = distance(FRAGCOORD.xy, player_pos);
    float mask = 0.0;
    
    // Create the ring effect
    if (dist < radius && dist > radius - width) {
        mask = 1.0 - (radius - dist) / width;
    }
    
    // Mix the screen texture with blackness
    vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
    COLOR = vec4(screen_color.rgb * mask, 1.0);
}