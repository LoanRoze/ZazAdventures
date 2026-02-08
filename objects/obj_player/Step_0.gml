// INPUTS 
press_right = (keyboard_check(ord("D")) || keyboard_check(vk_right))
press_left = (keyboard_check(ord("Q")) || keyboard_check(vk_left))
press_jump = (keyboard_check(vk_up) || keyboard_check_pressed(vk_space))
press_zaza = (keyboard_check(ord("Z")))

// BASIC MOVEMENT
if (!wall_jump_active) {
	var move = press_right - press_left;
	hsp = move * move_speed
}

vsp = vsp + grav

vision = lerp(vision, target_vision, 0.1);

// ZAZA COOLDOWNS
var outputTakingZazaCountDown = countDown(current_cooldown_taking_zaza)
current_cooldown_taking_zaza = outputTakingZazaCountDown.cooldown
is_taking_zaza = outputTakingZazaCountDown.is_in_state

var outputUnderZazaCountDown = countDown(current_cooldown_under_zaza)
current_cooldown_under_zaza = outputUnderZazaCountDown.cooldown
is_under_zaza = outputUnderZazaCountDown.is_in_state


if (is_taking_zaza) {
	sprite_index = spr_player_taking_zaza
	move_speed = base_move_speed * (1 - move_deflecator_percentage_in_percents_while_in_the_action_of_taking_zaza)
	jump_speed = base_jump_speed
}
else if (is_under_zaza) {
	sprite_index = spr_player_under_zaza
	move_speed = move_upgraded_by_zaza
	jump_speed = jump_upgraded_by_zaza
	target_vision = zaza_vision
}
else{
	sprite_index = spr_player
	move_speed = base_move_speed
	jump_speed = base_jump_speed
}

// ZAZA ACTIVATIOOOOON
if (press_zaza) {
	current_cooldown_taking_zaza = cooldown_taking_zaza
	current_cooldown_under_zaza = cooldown_under_zaza
}


// COLISIONS MURS
if (place_meeting(x + hsp, y, obj_solid)) {
	while (!place_meeting(x + sign(hsp), y, obj_solid)) {
		x = x + sign(hsp)
	}
	hsp = 0
}

if (place_meeting(x, y + vsp, obj_solid)) {
	while (!place_meeting(x, y + sign(vsp), obj_solid)) {
		y = y + sign(vsp)
	}
	vsp = 0
}


// --- Wall detection ---
var on_left_wall  = place_meeting(x - 1, y, obj_solid);  // collision mur gauche
var on_right_wall = place_meeting(x + 1, y, obj_solid);  // collision mur droit
var on_ground = place_meeting(x, y + 1, obj_solid);

if (!on_ground) {
    if (on_left_wall) vsp = min(vsp, wall_slide_speed);
    if (on_right_wall) vsp = min(vsp, wall_slide_speed);
}

if (press_jump) {
    if (!on_ground && (on_left_wall || on_right_wall)) {

        wall_jump_active = true;
        wall_jump_timer = wall_jump_duration;

        wall_jump_dir = on_left_wall ? 1 : -1;

        hsp = wall_jump_dir * base_wall_jump_hsp;
        vsp = wall_jump_vsp;
    }
    else if (on_ground) {
        vsp = jump_speed;
        wall_jump_active = false;
    }
}
if (hsp != 0) show_debug_message(hsp)
show_debug_message(wall_jump_active)



// --- Décélération après la première frame ---
if (!on_ground) {
    hsp *= 0.97; // réduit progressivement hsp pour prolonger le saut
    vsp *= 0.95; // réduit légèrement vsp pour effet arc plus doux
}





// COLISIONS OBJETS QUI TUENT
if (place_meeting(x, y, obj_danger)) {
	too_much_zaza()
}

function too_much_zaza() {

	instance_create_layer(0, 0, "Instances", obj_gameover);
	instance_destroy();
}


if (wall_jump_active) {
    wall_jump_timer--;

    // décroissance lente → va plus loin sans aller plus vite
    hsp *= 0.98;

    if (wall_jump_timer <= 0) {
        wall_jump_active = false;
    }
}
x += hsp
y += vsp

