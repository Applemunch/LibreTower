//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float time;

void main()
{
	vec4 color_replace = v_vColour;
	vec3 calc = vec3(sin(time) + color_replace.r, sin(time) + color_replace.g, sin(time) + color_replace.b);
	color_replace.rgb += calc / 4.0;
    gl_FragColor = color_replace * texture2D( gm_BaseTexture, v_vTexcoord );
}
