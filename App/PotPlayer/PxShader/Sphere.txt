// sphere=ps_2_0
// Code from MPC

sampler s0 : register(s0);
float4 p0 : register(c0);

#define clock (p0[3])

#define PI acos(-1)

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	// - this is a very simple raytracer, one sphere only
	// - no reflection or refraction, yet (my ati 9800 has a 64 + 32 instruction limit...)

	float3 pl = float3(3,-3,-4); // light pos
	float4 cl = float4(0.4, 0.4, 0.4, 0.4); // light color

	float3 pc = float3(0,0,-1); // cam pos
	float3 ps = float3(0,0,0.5); // sphere pos
	float r = 0.65; // sphere radius

	float3 pd = normalize(float3(tex.x-0.5, tex.y-0.5, 0) - pc);

	float A = 1;
	float B = 2*dot(pd, pc - ps);
	float C = dot(pc - ps, pc - ps) - r*r;
	float D = B*B - 4*A*C;

	float4 c0 = float4(0, 0, 0, 0);

	if(D >= 0)
	{
		// t2 is the smaller, obviously...
		// float t1 = (-B + sqrt(D)) / (2*A);
		// float t2 = (-B - sqrt(D)) / (2*A);
		// float t = min(t1, t2);

		float t = (-B - sqrt(D)) / (2*A);

		// intersection data
		float3 p = pc + pd*t;
		float3 n = normalize(p - ps);
		float3 l = normalize(pl - p);

		// mapping the image onto the sphere
#ifdef GLSL
		tex = float2(acos(-n)/PI);
#else
		tex = acos(-n)/PI, acos(-n)/PI;
#endif

		// rotate it
		tex.x = frac(tex.x + frac(clock/10));

		// diffuse + specular
		c0 = tex2D(s0, tex) * dot(n, l) + cl * pow(max(dot(l, reflect(pd, n)), 0), 50);
	}

	return c0;
}
