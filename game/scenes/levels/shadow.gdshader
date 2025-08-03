shader_type canvas_item;

uniform vec2 shadow_offset = vec2(-8.0, 6.0);
uniform vec4 shadow_color : source_color = vec4(0.0, 0.0, 0.0, 0.6);
uniform bool use_blur = true;
uniform float blur_strength = 1.5;

vec4 sample_blurred_shadow(sampler2D tex, vec2 uv, vec2 pixel_size) {
    vec4 color = vec4(0.0);
    float blur_pixels = blur_strength;
    int samples = int(blur_pixels * 2.0 + 1.0);
    float weight = 1.0 / float(samples);

    for (int i = -int(blur_pixels); i <= int(blur_pixels); i++) {
        vec2 offset_uv = uv + shadow_offset * pixel_size + vec2(float(i), 0.0) * pixel_size;
        color += texture(tex, offset_uv) * weight;
    }

    return color;
}

void fragment() {
    vec4 base_color = texture(TEXTURE, UV);
    
    // Use TEXTURE_PIXEL_SIZE instead of SCREEN_PIXEL_SIZE
    vec4 shadow_sample;
    if (use_blur) {
        shadow_sample = sample_blurred_shadow(TEXTURE, UV, TEXTURE_PIXEL_SIZE);
    } else {
        shadow_sample = texture(TEXTURE, UV + shadow_offset * TEXTURE_PIXEL_SIZE);
    }
    
    // Create shadow from the alpha channel
    vec4 shadow = vec4(shadow_color.rgb, shadow_color.a * shadow_sample.a);
    
    // Composite: draw shadow first, then base on top
    COLOR = mix(shadow, base_color, base_color.a);
}