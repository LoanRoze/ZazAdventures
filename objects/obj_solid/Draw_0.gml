var start_x = bbox_left;
var start_y = bbox_top;
var end_x   = bbox_right;
var end_y   = bbox_bottom;

// taille de la tuile (sprite d'origine)
var tile_w = sprite_get_width(sprite_index);
var tile_h = sprite_get_height(sprite_index);

// surface à couvrir
var total_w = end_x - start_x;
var total_h = end_y - start_y;

// nombre de répétitions
var tiles_x = ceil(total_w / tile_w);
var tiles_y = ceil(total_h / tile_h);

// mosaïque
for (var i = 0; i < tiles_x; i++) {
    for (var j = 0; j < tiles_y; j++) {
        draw_sprite(
            sprite_index,
            image_index,
            start_x + i * tile_w,
            start_y + j * tile_h
        );
    }
}