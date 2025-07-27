shader_type canvas_item;

render_mode blend_mix;
uniform sampler2D my_texture;
uniform vec2 scroll_speed = vec2(0.0, 0.1); // Movimiento vertical

void fragment() {
    vec2 uv = UV + scroll_speed * TIME;
    COLOR = texture(my_texture, fract(uv));
}
