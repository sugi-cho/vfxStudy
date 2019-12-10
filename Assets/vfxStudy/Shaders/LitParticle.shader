Shader "Unlit/LitParticle"
{
    Properties
    {
        _Intencity ("intencity", Float) = 10
        _Distance ("distance", Float) = 10
        _Limit ("intencity limit", Float) = 5
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 100

        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"
            #define epsillon 0.000001

            struct appdata
            {
                float4 vertex : POSITION;
                float2 uv : TEXCOORD0;
            };

            struct v2f
            {
                float2 uv : TEXCOORD0;
                float4 vertex : SV_POSITION;
            };

            half _Intencity, _Distance, _Limit;

            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.uv = v.uv;
                return o;
            }

            half4 frag (v2f i) : SV_Target
            {
                half d = length(i.uv - 0.5);
                half l = _Intencity;
                if(epsillon < d)
                    l /= d*d*_Distance;
                l = lerp(l,0,saturate(d*2.0));
                l = min(l, _Limit);
                return l;
            }
            ENDCG
        }
    }
}
