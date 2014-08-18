

#pragma debug(on)
#pragma optimize(off)

attribute float size;
attribute vec3 customColor;
attribute vec3 acceleration;
attribute vec3 velocity;

varying vec3 vColor;

vec4 GetPos() {

    vec3 newPos = vec3( position );

    vec3 a = acceleration;
    vec3 v = velocity;

    v = v + a;

    // Add velocity vector to the newPos vector
    newPos = newPos + v;

    // Convert the newPos vector into world-space
    vec4 mvPosition = modelViewMatrix * vec4( newPos, 1.0 );

    return mvPosition;
}

void main() {

    vColor = customColor;

    gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);

    gl_PointSize = size;

}

