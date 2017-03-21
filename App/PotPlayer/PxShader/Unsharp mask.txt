// unsharp mask=ps_2_0
// Code from MPC
// unsharp mask by crantastic

sampler s0 : register(s0);
float4 p0 : register(c0);
float4 p1 : register(c1);

#define width (p0[0])
#define height (p0[1])
#define counter (p0[2])
#define clock (p0[3])
#define one_over_width (p1[0])
#define one_over_height (p1[1])

#define PI acos(-1)

//Feel free to change the threshold or intensity
#define threshold .0009
#define intensity .5

float4 main(float2 tex : TEXCOORD0) : COLOR
{
	float dx = 4/width;
	float dy = 4/height;

	float4 c1 = tex2D(s0, tex + float2(-dx,dy));
	float4 c2 = tex2D(s0, tex + float2(0,dy));
	float4 c3 = tex2D(s0, tex + float2(dx,dy));
	float4 c4 = tex2D(s0, tex + float2(-dx,0));
	float4 c5 = tex2D(s0, tex + float2(0,0));
	float4 c6 = tex2D(s0, tex + float2(dx,0));
	float4 c7 = tex2D(s0, tex + float2(-dx,-dy));
	float4 c8 = tex2D(s0, tex + float2(0,-dy));
	float4 c9 = tex2D(s0, tex + float2(dx,-dy));

	float4 c10 = (2*(c2 + c4 + c6 + c8) + (c1 + c3 + c7 + c9)+ 4*c5)/16;
	float4 c11;
	float4 c0;

	float val = abs(dot(c10-c5,float4(0.299, 0.587, 0.114, 0)));
	c11 = float4(val, val, val, val);

	if( abs(dot(c10-c5, float4(0.299, 0.587, 0.114, 0)))< threshold) c0 =c5;
	else c0 = c5+intensity*(c5-c10);

	//these two lines reduce sharpening of the black borders
	if (dot(c1, float4(0.299, 0.587, 0.114, 0)) < .067)
	{
		if(dot(c2, float4(0.299, 0.587, 0.114, 0)) < .067 )
		{
			if(dot(c3, float4(0.299, 0.587, 0.114, 0)) > .5005) c0 = c5;
		}
	}
	if (dot(c7, float4(0.299, 0.587, 0.114, 0)) < .067)
	{
		if(dot(c8, float4(0.299, 0.587, 0.114, 0)) < .067 )
		{
			if(dot(c9, float4(0.299, 0.587, 0.114, 0)) > .5005) c0 = c5;
		}
	}

	return c0;
};