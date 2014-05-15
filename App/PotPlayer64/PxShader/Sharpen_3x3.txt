// Sharpen_3x3=ps_2_0
// http://www.homecinema-fr.com/forum/viewtopic.php?t=29814317 

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

#define x 0.8 

float4 main(float2 tex : TEXCOORD0) : COLOR 
{ 

   float dx = one_over_width*x;
   float dy = one_over_height*x;

   float4 c9 = tex2D(s0, tex) * 2.0; 

   float4 c1 =  tex2D( s0, tex + float2( -dx , -dy ) ) * 0.1; 
   c1 +=  tex2D( s0, tex + float2( 0 , -dy ) ) * 0.15; 
   c1 +=  tex2D( s0, tex + float2( dx , -dy ) ) * 0.1; 

   c1 +=  tex2D( s0, tex + float2( -dx , 0 ) ) * 0.15; 
   c1 +=  tex2D( s0, tex + float2( dx , 0 ) ) * 0.15; 

   c1 +=  tex2D( s0, tex + float2( -dx , dy ) ) * 0.1; 
   c1 +=  tex2D( s0, tex + float2( 0 , dy ) ) * 0.15; 
   c1 +=  tex2D( s0, tex + float2( dx , dy ) ) * 0.1; 

   float4 c0 = c9 -c1 ; 

   return c0; 
} 