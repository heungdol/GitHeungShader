﻿// Upgrade NOTE: replaced '_Object2World' with 'unity_ObjectToWorld'
// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "MyShader/Custom/Object_Toon"
{
    Properties 
    {
        _Color ("Main Color", Color) = (1,1,1,1)
        _MainTex ("Base (RGB) Alpha (A)", 2D) = "white" {}
        _ShadowCol ("Shadow Color", Color) = (0, 0, 0, 1)
        [IntRange] _ShadowLevel ("Shadow Level", Range (2, 9)) = 2
        _ShadowPow ("Shadow Power", Range (0.1, 10)) = 1
    }
    SubShader 
    {
    
        Tags {"Queue" = "Geometry" "RenderType" = "Opaque"}
        Pass 
        {
            Tags
			{
				"LightMode" = "ForwardBase"
			}
           		CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #pragma multi_compile_fwdbase                       // This line tells Unity to compile this pass for forward add, giving attenuation information for the light.
                
                #include "UnityCG.cginc"
                #include "Lighting.cginc"
			    #include "AutoLight.cginc"
                
                struct v2f
                {
                    float4  pos         : SV_POSITION;
                    float2  uv          : TEXCOORD0;
                    float3  lightDir    : TEXCOORD2;
                    float3 normal		: TEXCOORD1;
                    LIGHTING_COORDS(3,4)                            // Macro to send shadow & attenuation to the vertex shader.
                };
 
                v2f vert (appdata_tan v)
                {
                    v2f o;
                    
                    o.pos = UnityObjectToClipPos( v.vertex);
                    o.uv = v.texcoord.xy;
                   	
					o.lightDir = ObjSpaceLightDir(v.vertex);
					
					o.normal =  v.normal;
                    TRANSFER_VERTEX_TO_FRAGMENT(o);                 // Macro to send shadow & attenuation to the fragment shader.
                    return o;
                }
 
                sampler2D _MainTex;
                fixed4 _Color;
                fixed4 _ShadowCol;

                fixed4 frag(v2f i) : COLOR
                {
                    fixed atten = LIGHT_ATTENUATION(i); // Macro to get you the combined shadow & attenuation value.
                    fixed4 tex = tex2D(_MainTex, i.uv);
                    
                    tex *= _Color;

                    fixed4 c;
                    c.rgb = _ShadowCol * tex.rgb;
                    c.a = 1;
                    return c;
                }
            ENDCG
        }
 
        Pass {
            Tags {"LightMode" = "ForwardAdd"}                       // Again, this pass tag is important otherwise Unity may not give the correct light information.
            Blend One One                                           // Additively blend this pass with the previous one(s). This pass gets run once per pixel light.
            CGPROGRAM
                #pragma vertex vert
                #pragma fragment frag
                #pragma multi_compile_fwdadd                       // This line tells Unity to compile this pass for forward add, giving attenuation information for the light.
                
                #include "UnityCG.cginc"
                #include "Lighting.cginc"
			    #include "AutoLight.cginc"
                
                struct v2f
                {
                    float4  pos         : SV_POSITION;
                    float2  uv          : TEXCOORD0;
                    float3  lightDir    : TEXCOORD2;
                    float3 normal		: TEXCOORD1;
                    float3 worldPos : TEXCOORD4;
                    LIGHTING_COORDS(3,4)                            // Macro to send shadow & attenuation to the vertex shader.
                    
                };
 
                v2f vert (appdata_tan v)
                {
                    v2f o;
                    
                    o.pos = UnityObjectToClipPos( v.vertex);
                    o.uv = v.texcoord.xy;
                   	
					o.lightDir = ObjSpaceLightDir(v.vertex);
					
					o.normal =  v.normal;
                    TRANSFER_VERTEX_TO_FRAGMENT(o);                 // Macro to send shadow & attenuation to the fragment shader.
                    
                    o.worldPos = mul(unity_ObjectToWorld, v.vertex);
                    return o;
                }
 
                sampler2D _MainTex;
                fixed4 _Color;

                fixed4 _ShadowCol;
                int _ShadowLevel;
                float _ShadowPow;

                fixed4 frag(v2f i) : COLOR
                {
                    i.lightDir = normalize(i.lightDir);
                    
                    fixed atten = LIGHT_ATTENUATION(i); // Macro to get you the combined shadow & attenuation value.
                    fixed3 col = tex2D(_MainTex, i.uv).rgb;
                    
                    col *= _Color.rgb;
                   
					fixed3 normal = UnityObjectToWorldNormal (i.normal);        
                    fixed diff = saturate(dot(i.normal, i.lightDir));
                    diff = diff * 0.5 + 0.5;
                    diff *= atten;
                    diff = pow (diff, _ShadowPow);

                    float gapLevel = 1.0 / _ShadowLevel;
                    //float lightLevel = diff / gapLevel;
                    float3 rampColor;

                    // (i-1)/(n-1)
                    // round 등 반올림을 하면 비율이 망가짐
                    for (int i = 1; i <= _ShadowLevel; i++)
                    {
                        if ((i-1) * gapLevel <= diff && diff <= i * gapLevel)
                        {
                            float r = (i-1.0) / (_ShadowLevel-1.0);
                            rampColor = lerp (0, _LightColor0.rgb, r);
                            break;
                        }
                    }
 
                    fixed4 c;
                    c.rgb = col * rampColor;
                    c.a = 1;

                    return c; 
                }
            ENDCG
        }
    }
    FallBack "VertexLit"  
}