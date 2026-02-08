// récupérer le joueur
if (!instance_exists(player)) player = instance_find(obj_player, 0);
if (!instance_exists(player)) exit;      // pas de joueur, on sort
if (!sprite_exists(sprite_index)) exit;

var cam = view_camera[0];
var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);

draw_set_alpha(0.8);
draw_rectangle_colour(
    cx, cy,
    cx + camera_get_view_width(cam),
    cy + camera_get_view_height(cam),
    c_black, c_black, c_black, c_black, false
);
draw_set_alpha(1);

var px = obj_player.x + obj_player.sprite_width  * 0.5;
var py = obj_player.y + obj_player.sprite_height * 0.5;
// dessiner le sprite de lumière en scale selon player.vision
var scale_x = player.vision;
var scale_y = player.vision;

draw_sprite_ext(spr_light, 0, px, py, scale_x, scale_y, 0, c_white, 1);
