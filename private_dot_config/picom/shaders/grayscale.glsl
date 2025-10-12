#version 330
uniform sampler2D tex;

in vec2 texcoord;

vec4 default_post_processing(vec4 c);

float rgb2h( in vec3 c ){
    vec4 K = vec4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
    vec4 p = mix(vec4(c.bg, K.wz),
                 vec4(c.gb, K.xy),
                 step(c.b, c.g));
    vec4 q = mix(vec4(p.xyw, c.r),
                 vec4(c.r, p.yzx),
                 step(p.x, c.r));
    float d = q.x - min(q.w, q.y);
    float e = 1.0e-10;
    return abs(q.z + (q.w - q.y) / (6.0 * d + e));
}

vec4 window_shader() {
    vec4 c = texelFetch(tex, ivec2(texcoord), 0);
    c = default_post_processing(c);
    float g = 0.2126 * c.r + 0.7152 * c.g + 0.0722 * c.b;   // CIELAB luma, based on human tristimulus.
    float h = rgb2h(c.rgb);
    // It keeps red untouch, I don't remember how, but it's intentional.
    // It's like: get the value of hue in hsl, get the red part and
    // mix it. step is like a ternary operator, I think.
    // c = mix(vec4(vec3(g), c.a), c, step(0.9583, h));
    c = vec4(vec3(g), c.a);
    return c;
}
