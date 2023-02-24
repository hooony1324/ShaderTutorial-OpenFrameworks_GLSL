#version 410

layout (location = 0) in vec3 pos;
layout (location = 3) in vec2 uv;

uniform vec2 size;
uniform vec2 offset;
uniform vec3 translation;
uniform vec3 scale;
uniform float radian;

out vec2 fragUV;

void main()
{
	vec3 newpos = pos * scale;

	newpos.x = (cos(radian) * newpos.x) - (sin(radian) * newpos.y);
	newpos.y = (cos(radian) * newpos.y) + (sin(radian) * newpos.x);


	newpos += translation;

	gl_Position = vec4(newpos, 1.0);
	fragUV = vec2(uv.x, 1.0-uv.y) * size + (offset*size);
} 