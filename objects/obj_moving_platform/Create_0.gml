end_pt   = instance_nearest(x, y, obj_platformEnd);

if (!instance_exists(end_pt)) {
    show_debug_message("ERREUR : bornes de plateforme manquantes");
    instance_destroy();
}

// références aux points
begin_x = x
begin_y = y

end_x = end_pt.x;
end_y = end_pt.y;

show_debug_message("platform creation")
show_debug_message(begin_x)
show_debug_message(end_x)
show_debug_message(begin_y)
show_debug_message(end_y)

// position de départ
x = begin_x;
y = begin_y;

// vitesse (pixels par step)
speed_move = 2;
t = 0

// direction (1 = vers end, -1 = vers begin)
dir = 1;

dx = 0;
dy = 0;