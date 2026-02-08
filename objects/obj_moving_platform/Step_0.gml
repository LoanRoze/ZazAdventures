// ancienne position
var old_x = x;
var old_y = y;

// progression
t += dir * (speed_move / point_distance(begin_x, begin_y, end_x, end_y));

// clamp
t = clamp(t, 0, 1);

// interpolation
x = lerp(begin_x, end_x, t);
y = lerp(begin_y, end_y, t);

// déplacement réel
dx = x - old_x;
dy = y - old_y;

// inversion aux bornes
if (t == 1 || t == 0) {
    dir *= -1;
}