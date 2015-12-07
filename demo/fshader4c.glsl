#ifdef GL_ES
precision mediump float;	// set default precision to medium
#endif

varying vec4 v_Color;

void main() {
        gl_FragColor = v_Color;
}
