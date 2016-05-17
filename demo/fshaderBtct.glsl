#ifdef GL_ES
precision mediump float;	// set default precision to medium
#endif

varying	vec2	    v_TexCoord;	// varying variable for passing texture coordinate from vertex shader
uniform	sampler2D   u_Sampler;	// uniform variable for the texture image
uniform float       u_brightness;
uniform float       u_contrast;
uniform float       u_refrence;

void main() {
    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
    gl_FragColor = (gl_FragColor - u_refrence) * u_contrast + u_refrence + u_brightness;
    if(gl_FragColor.r < 0.f){
        gl_FragColor.r = 0.f;
    }
    if(gl_FragColor.r > 1.0f){
        gl_FragColor.r = 255.0f;
    }
    if(gl_FragColor.g < 0.f){
        gl_FragColor.g = 0.f;
    }
    if(gl_FragColor.g > 1.0f){
        gl_FragColor.g = 255.0f;
    }
    if(gl_FragColor.b < 0.f){
        gl_FragColor.b = 0.f;
    }
    if(gl_FragColor.b > 1.0f){
        gl_FragColor.b = 255.0f;
    }
}
