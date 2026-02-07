// Centre de la fenêtre
var x_center = display_get_gui_width() / 2;
var y_center = display_get_gui_height() / 2;

// Overlay noir opaque pour cacher le jeu derrière
draw_set_color(c_black);
draw_set_alpha(1);
draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);

// Titre
draw_sprite(spr_title, 0, x_center, y_center + title_offset);

// Boutons
draw_sprite(spr_restart, 0, x_center, y_center + restart_offset);
draw_sprite(spr_leave, 0, x_center, y_center + leave_offset);