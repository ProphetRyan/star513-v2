uniform float uTime;
uniform float uNoiseStrength;
uniform vec2 uResolution;
varying vec2 vUv;
varying vec3 vPosition;
varying vec3 vColor;

void main() {
    vec2 uv = gl_FragCoord.xy / uResolution;
    vec3 color = vColor;

    float x = (uv.x + 4.0 ) * (uv.y + 4.0 ) * ((mod(uTime, 60.0) + 5.0) * 10.0);
    vec4 grain = vec4(mod((mod(x, 13.0) + 1.0) * (mod(x, 123.0) + 1.0), 0.01)-0.005) * uNoiseStrength;

    //color.b += noise;

    gl_FragColor = vec4(color, 1.) + grain;
}
