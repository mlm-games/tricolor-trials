shader_type canvas_item;

uniform float progress : hint_range(-1.0, 2.0) = 0.0;
uniform float smoothness : hint_range(0.0, 0.5) = 0.1;
uniform vec2 direction = vec2(1.0, -0.5); // Diagonal wipe direction
uniform vec4 wipe_color : source_color = vec4(0.1, 0.5, 0.5, 1.0);

void fragment() {
    vec2 uv = UV;

    vec2 dir = normalize(direction);

    float wipe_pos = dot(uv - vec2(0.5), dir) + 0.5;

    float adjusted_progress = progress * (1.0 + smoothness) - smoothness * 0.5;

    // smoothing
    float alpha = smoothstep(adjusted_progress - smoothness, adjusted_progress + smoothness, wipe_pos);

    vec4 original = texture(TEXTURE, uv);
	original = vec4(original.rgb, 0.0);
    COLOR = mix(original, wipe_color, alpha);
}