#ifdef GL_ES
precision mediump float;            // set default precision to medium
#endif

attribute vec3	a_Position;         // attribute variable: position vector
attribute vec3  a_Normal;
attribute vec2	a_TexCoord;	// attribute variable: texture coordinate
varying   vec2	v_TexCoord;	// varying variable for passing texture coordinate to fragment shader
uniform   vec3  u_LightDirection;
uniform	  mat4	u_Model;            // uniform variable for passing modelview matrix
uniform   mat4  u_View;
uniform	  mat4	u_Projection;       // uniform variable for passing projection matrix

void main() {
    //normalize vectors
    vec3 pos = vec3(u_View * u_Model * vec4(a_Position,1.0f));
    vec3 N   = normalize(vec3(u_View * u_Model * vec4(a_Normal,1.0f)));
    vec3 L   = normalize(u_LightDirection - pos);
    vec3 E   = normalize(pos * -1.0f);
    vec3 R   = normalize(2.0f*dot(L,N) * N - L);

    //diffuse
    float kD      = max(dot(a_Normal, u_LightDirection),0.0);
    vec3 diffuse  = vec3(0.2f,0.9f,1.0f) * kD;
    //ambient
    vec3 ambient  = vec3(0.1f,0.1f,0.1f) * kD;
    //specular
    float kS      = pow(max(dot(N,R), 0.0f), 0.7f);
    vec3 specular = kS * vec3(0.6f, 0.5f, 0.3f);
    if(dot(L,N) < 0.0f){
        specular  = vec3(0.0f,0.0f,0.0f);
    }
    v_TexCoord    = a_TexCoord;
    gl_Position   = u_Projection * u_View * u_Model * vec4(a_Position,1.0f);
}
