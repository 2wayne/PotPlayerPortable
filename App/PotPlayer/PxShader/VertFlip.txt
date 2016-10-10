// VertFlip=ps_2_0

sampler s0 : register(s0);
float4 p2 :  register(c2);

#define left (p2[0])
#define top (p2[1])
#define right (p2[2])
#define bottom (p2[3])

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float4 c0;

	if(tex.x >= left && tex.x <= right && tex.y >= top && tex.y <= bottom)
	{
		c0 = tex2D(s0, float2(tex.x, bottom + top - tex.y));
	}
	else c0 = tex2D(s0, float2(tex.x, tex.y));

	return c0; 
}
