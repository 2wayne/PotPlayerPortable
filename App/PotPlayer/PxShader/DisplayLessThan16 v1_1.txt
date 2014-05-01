// DisplayLessThan16 v1.1=ps_2_0
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
#define Value_16 (16.0/255.0) 

float4 main(float2 tex : TEXCOORD0) : COLOR 
{ 
   float4 c0 = tex2D(s0, tex); 

   if( c0[0]<Value_16 ) 
      c0 = float4( 0, 1, 0, 0 ); 
   else if( c0[1]<Value_16 ) 
      c0 = float4( 0, 1, 0, 0 ); 
   else if( c0[2]<Value_16 ) 
      c0 = float4( 0, 1, 0, 0 ); 

   return c0; 
}