varying vec2 v_vTexcoord;
varying vec4 v_vColour;
uniform vec2 pos;//x,y
const int Quality = 64;

void main()
{
    vec4 Color;
    for( float i=0.0;i<1.0;i+=1.0/float(Quality) )
    {
            Color += texture2D( gm_BaseTexture, v_vTexcoord+((0.4,0.5)-pos)*i);
    }
    Color /= float(Quality);
    gl_FragColor =  Color *  v_vColour;
}
