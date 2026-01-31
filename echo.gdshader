shader_type canvas_item;

uniform vec2 resolution = vec2(1920.0, 1080.0);
uniform vec3 color: source_color = vec3(0.1,0.4,0.7);
uniform float zoom: hint_range(0.1, 3.0, 0.01) = 2.0;
uniform float speed: hint_range(0.0, 10.0, 0.01) = 2.0;
uniform float contrast: hint_range(1.0, 50.0, 0.01) = 20.0;
uniform float alpha_treshold: hint_range(0.0, 1.0, 0.01) = 0.00;

void fragment() {
	vec2 uv = UV - 0.5;
	uv.x *= resolution.x / resolution.y;
	uv *= zoom;
	float time = fract(TIME*0.5);
	float r = length(uv);
	float pulse = smoothstep(time - 0.1, time, r);
	vec3 result = abs(1.0 / (pulse * contrast) * color);
	float avg = (result.r + result.g + result.b) /3.0;
	COLOR = vec4(result, avg <= alpha_treshold ? 0.0 :1.0);
	}