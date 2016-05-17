attribute   vec2        a_Position;    // attribute variable: position vector
attribute   vec2        a_TexCoord;    // attribute variable: texture coordinate
varying     vec2        v_TexCoord;

void main(){
    gl_Position = gl_ModelViewProjectionMatrix * vec4(a_Position,0,1);
    gl_TexCoord[0] = vec4(a_TexCoord,0,1);
    v_TexCoord = a_TexCoord;
}
