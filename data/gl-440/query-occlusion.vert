#version 420 core
#extension GL_ARB_shader_storage_buffer_object : require

#define TRANSFORM0	1
#define VERTEX		0

layout(binding = TRANSFORM0) uniform transform
{
	mat4 MVP;
} Transform;

layout(binding = VERTEX) buffer mesh
{
	vec2 Position[];
} Mesh;

out gl_PerVertex
{
	vec4 gl_Position;
};

void main()
{	
	gl_Position = Transform.MVP * vec4(Mesh.Position[gl_VertexID], 0.0, 1.0);
}

