
#if defined vert

#define SHADOW_MAP_BIAS 0.75

varying vec4 texcoord;

void main()
{
    gl_Position = ftransform();
    float dist = length(gl_Position.xy);
    float distortFactor = (1.0 - SHADOW_MAP_BIAS) + dist * SHADOW_MAP_BIAS;
    gl_Position.xy /= distortFactor;

    texcoord = gl_MultiTexCoord0;
}

#endif
//---------------------------------------------------------

//---------------------------------------------------------

#if defined frag

uniform sampler2D texture;

varying vec4 texcoord;

void main()
{
    gl_FragData[0] = texture2D(texture, texcoord.st);
}
#endif