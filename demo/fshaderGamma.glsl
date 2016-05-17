#ifdef GL_ES
precision mediump float;	// set default precision to medium
#endif

varying	vec2	  v_TexCoord;	// varying variable for passing texture coordinate from vertex shader
uniform	sampler2D u_Sampler;	// uniform variable for the texture image
uniform float       u_gamma;

void main() {
    gl_FragColor = texture2D(u_Sampler, v_TexCoord);
    gl_FragColor.r = pow(gl_FragColor.r, u_gamma);
    gl_FragColor.g = pow(gl_FragColor.g, u_gamma);
    gl_FragColor.b = pow(gl_FragColor.b, u_gamma);
}
