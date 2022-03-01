Shader "Unlit/Test"
{
    Properties
    {
        _Color("Color", Color) = (0,0,1)
        _Power("Power",Range(0,1)) = 0.5
        _MainTex("MainTexture", 2D) = "pink"{}
    }
    SubShader
    {
        Tags
        {
            "RenderType"="Opaque"
        }
        LOD 100

        Pass
        {
            //Cull Front
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #include "UnityCG.cginc"

            float4 _Color;

            struct myStruct
            {
                float4 vert : POSITION;
                float3 normal : NORMAL;
            };

            struct appdata
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color : COLOR;
            };

            v2f vert(myStruct v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vert);
                o.color.rgb = v.normal.rgb;
                o.color.rgba = _WorldSpaceLightPos0;
                return o;
            }

            fixed4 frag(v2f i) : SV_Target
            {
                return i.color;
            }
            ENDCG
        }

        //        Pass
        //        {
        //            CGPROGRAM
        //            #pragma vertex vert
        //            #pragma fragment frag
        //            #include "UnityCG.cginc"
        //
        //            float4 _Color;
        //
        //            struct appdata
        //            {
        //                float4 vertex : POSITION;
        //            };
        //
        //            struct v2f
        //            {
        //                float4 vertex : SV_POSITION;
        //            };
        //
        //            v2f vert(appdata v)
        //            {
        //                v2f o;
        //                o.vertex = UnityObjectToClipPos(v.vertex * 0.9);
        //                return o;
        //            }
        //
        //            fixed4 frag(v2f i) : SV_Target
        //            {
        //                return float4(1, 1, 1, 1);
        //            }
        //            ENDCG
        //        }
    }
}