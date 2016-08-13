// grayscale=ps_2_0
// Code from MPC

sampler s0 : register(s0);
float2 c0;

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float3 s1 = tex2D(s0, tex).rgb;// original pixel
	float3 sg;
	if(c0.x < 1120 && c0.y < 630) sg = float3(.299, .587, .114);// SD grayscale
	else sg = float3(.2126, .7152, .0722);// HD grayscale
	return dot(s1, sg);// grayscale output
}