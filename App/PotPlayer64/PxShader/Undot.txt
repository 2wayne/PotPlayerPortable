// Undot=ps_3_0
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

#define dx one_over_width 
#define dy one_over_height 

#define val0 0.2 

float4 main(float2 tex : TEXCOORD0) : COLOR 
{ 
   float4 current = tex2D(s0, tex); 

   float4 Total = current ; 
   float n = 1; 

   float4 c0 =  tex2D( s0, tex + float2( -dx , -dy ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 


   c0 =  tex2D( s0, tex + float2( 0 , -dy ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   c0 =  tex2D( s0, tex + float2( dx , -dy ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   c0 =  tex2D( s0, tex + float2( -dx , 0 ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   c0 =  tex2D( s0, tex + float2( dx , 0 ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   c0 =  tex2D( s0, tex + float2( -dx , dy ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   c0 =  tex2D( s0, tex + float2( 0 , dy ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   c0 =  tex2D( s0, tex + float2( dx , dy ) ); 
   if( length( current - c0 ) > val0  ) 
   { 
      Total += c0; 
      n += 1.0; 
   } 

   return( Total / n ); 
} 