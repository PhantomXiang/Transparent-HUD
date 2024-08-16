#version 150

uniform vec4 ColorModulator;
out vec4 fragColor;
in vec4 vertexColor; 
vec4 color = vertexColor;

void main() {
    if (0.0 == color.a) {
        discard;
    }
    // background color
    if (color.r == 16/255.0 && color.g == 0/255.0 && color.b == 16/255.0) {
        color = vec4(0, 0, 0, 0.75);
    }
    // border color
    if (color.r >= 0.15686 && color.r <= 0.31373 && color.g == 0 && color.b >= 0.49 && color.b <= 1) {
        color = vec4(2 *  (color.b - 0.49), 0.5 + (color.b - 1.0) * (-0.5), 1.0, 0.75);
    } 
    
    fragColor = color * ColorModulator;
}
