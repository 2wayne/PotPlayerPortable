sampler s0 : register(s0);

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	return float4(0, dot(tex2D(s0, tex), float4(.375, .5, .125, 0)), 0, 0);// output a distorted grayscale to the green channel only
}