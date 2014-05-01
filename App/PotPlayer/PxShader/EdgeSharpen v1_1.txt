// EdgeSharpen v1.1=ps_2_0
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

#define Edge_width      2.0 
#define Edge_threshold       0.2 

#define Sharpen_width       1.2 
#define Sharpen_val0       2.0 
#define Sharpen_val1       0.125 

float4 main(float2 tex : TEXCOORD0) : COLOR 
{ 
   // Read current pixel color 
   float4 Res = tex2D( s0, tex ); 

   // Edge detection width vector 
   float dx = Edge_width / height; 
   float dy = Edge_width / width; 

   // Read corners color 
   float4 c2 = tex2D(s0, tex + float2( 0,-dy) ); 
   float4 c3 = tex2D(s0, tex + float2(-dx,0) ); 
   float4 c4 = tex2D(s0, tex + float2( dx,0) ); 
   float4 c5 = tex2D(s0, tex + float2( 0, dy) ); 

   // Compute vector lenght 
   float4 c0 = Res*4 - c2 - c3 - c4 - c5; 

   // If vector lenght > Edge_threshold : sharp this pixel 
   if( length(c0) > Edge_threshold ) 
   { 
      // Compute sharpen's width vector 
      dx = Sharpen_width / width; 
      dy = Sharpen_width / height; 
  
      // Read 8 around pixels color 
      float4 c1 = tex2D(s0, tex + float2(-dx,-dy)) ; 
      c2 = tex2D(s0, tex + float2(0,-dy)) ; 
      c3 = tex2D(s0, tex + float2(-dx,0)) ; 
      c4 = tex2D(s0, tex + float2(dx,0)); 
      c5 = tex2D(s0, tex + float2(0,dy)) ; 
      float4 c6 = tex2D(s0, tex + float2(dx,dy)) ; 
      float4 c7 = tex2D(s0, tex + float2(-dx,+dy)); 
      float4 c8 = tex2D(s0, tex + float2(+dx,-dy)) ; 

      float4 c9 =Res * Sharpen_val0; 

      Res = c9 - (c1 + c2 + c3 + c4 + c5 + c6 + c7 + c8 ) * Sharpen_val1 ; 

      // Uncomment next line to see detected Edges in red ... 
      //Res = float4( 1.0, 0.0, 0.0, 0.0 ); 

   } 

   return Res; 
}