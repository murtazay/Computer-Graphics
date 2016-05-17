#ifdef GL_ES
precision mediump float;	// set default precision to medium
#endif

varying	vec2	  v_TexCoord;	// varying variable for passing texture coordinate from vertex shader
uniform	sampler2D u_Sampler;	// uniform variable for the texture image
uniform float       u_threshold;

void main() {
    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
    if(gl_FragColor.r < u_threshold){
        gl_FragColor.r = 0.0f;
    }
    else{
        gl_FragColor.r = 255.0f;
    }
    if(gl_FragColor.g < u_threshold){
        gl_FragColor.g = 0.0f;
    }
    else{
        gl_FragColor.g = 255.0f;
    }
    if(gl_FragColor.b < u_threshold){
        gl_FragColor.b = 0.0f;
    }
    else{
        gl_FragColor.b = 255.0f;
    }
}
