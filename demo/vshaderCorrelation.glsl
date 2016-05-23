attribute   vec2        a_Position;    // attribute variable: position vector
attribute   vec2        a_TexCoord;    // attribute variable: texture coordinate
varying     vec2        v_TexCoord;
varying     vec4        v_TMean;
uniform     sampler2D   u_Texture;
uniform     float       u_TemplateWidth;
uniform     float       u_TemplateHeight;
uniform     float       u_TemplateXStep;
uniform     float       u_TemplateYStep;

void main(){
    gl_Position = gl_ModelViewProjectionMatrix * vec4(a_Position,0,1);
    vec4 mean = vec4(0.f);
    float n   = 0.f;
    for(float i = 0.f; i < u_TemplateWidth; i += u_TemplateXStep){
        for(float j = 0.f; j < u_TemplateHeight; j += u_TemplateYStep){
            mean += texture2D(u_Texture, vec2(i,j));
            n += 1.f;
        }
    }
    v_TMean = mean / n;
    v_TexCoord = a_TexCoord;
}
