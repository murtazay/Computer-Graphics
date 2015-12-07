#ifdef GL_ES
precision mediump float;            // set default precision to medium
#endif

attribute vec3	a_Position;         // attribute variable: position vector
attribute vec3  a_Normal;
varying   vec3  fN;
varying   vec3  fE;
varying   vec3  fL;
uniform	  mat4	u_Model;            // uniform variable for passing modelview matrix
uniform   mat4  u_View;
uniform	  mat4	u_Projection;       // uniform variable for passing projection matrix
uniform   vec3  u_LightDirection;

void main() {
    fN = a_Normal.xyz;
    fE = a_Position.xyz;
    fL = u_LightDirection - a_Position;
    gl_Position = u_Projection * u_Model * u_View * vec4(a_Position, 1.0f);
}
