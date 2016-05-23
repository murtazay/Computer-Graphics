#ifdef GL_ES
precision mediump float;	// set default precision to medium
#endif

varying	vec2	  v_TexCoord;	// varying variable for passing texture coordinate from vertex shader
uniform	sampler2D u_Sampler;	// uniform variable for the texture image
uniform sampler1D u_threshold;

void main() {
    gl_FragColor   = texture2D(u_Sampler, v_TexCoord);
    gl_FragColor.r = texture1D(u_threshold, gl_FragColor.r).r;
    gl_FragColor.g = texture1D(u_threshold, gl_FragColor.g).r;
    gl_FragColor.b = texture1D(u_threshold, gl_FragColor.b).r;
}
