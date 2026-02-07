// Centre de la fenêtre GUI
// Récupère la caméra active de la room
var cam = view_camera[0];

// Centre de la caméra
var x_center = camera_get_view_x(cam) + camera_get_view_width(cam) / 2;
var y_center = camera_get_view_y(cam) + camera_get_view_height(cam) / 2;
show_debug_message(x_center)

// Détection clic sur Restart
if (mouse_check_button_pressed(mb_left)) {
    if (mouse_x > x_center - sprite_get_width(spr_restart)/2 &&
        mouse_x < x_center + sprite_get_width(spr_restart)/2 &&
        mouse_y > y_center + restart_offset - sprite_get_height(spr_restart)/2 &&
        mouse_y < y_center + restart_offset + sprite_get_height(spr_restart)/2) {
        room_restart();
    }

    // Détection clic sur Leave
    if (mouse_x > x_center - sprite_get_width(spr_leave)/2 &&
        mouse_x < x_center + sprite_get_width(spr_leave)/2 &&
        mouse_y > y_center + leave_offset - sprite_get_height(spr_leave)/2 &&
        mouse_y < y_center + leave_offset + sprite_get_height(spr_leave)/2) {
        game_end();
    }
}