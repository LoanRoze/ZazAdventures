press_right = (keyboard_check(ord("D")) || keyboard_check(vk_right))
press_left = (keyboard_check(ord("Q")) || keyboard_check(vk_left))
press_jump = (keyboard_check(vk_up) || keyboard_check_pressed(vk_space))
press_zaza = (keyboard_check(ord("E")))


var move = press_right - press_left;
hsp = move * move_speed
vsp = vsp + grav


if (wait_timer > 0) {
	show_debug_message("chef ?")
    wait_timer -= 1; // on compte à rebours
	is_taking_zaza = true	
} else {
    // ce code sera exécuté après 1 seconde
	is_taking_zaza = false
}

if (is_taking_zaza) {
	show_debug_message("mets le sprite");
	sprite_index = spr_player_taking_zaza
	move_speed = base_move_speed * (1 - move_deflecator_percentage_in_percents_while_in_the_action_of_taking_zaza)
}
else {
	sprite_index = spr_player
	move_speed = base_move_speed
}
show_debug_message(move_speed)

if (press_jump && place_meeting(x, y + 1, obj_solid)) {
	vsp += jump_speed
}

if (press_zaza) {
	takeZaza()
}

if (place_meeting(x + hsp, y, obj_solid)) {
	while (!place_meeting(x + sign(hsp), y, obj_solid)) {
		x = x + sign(hsp)
	}
	hsp = 0
}
x = x + hsp

if (place_meeting(x, y + vsp, obj_solid)) {
	while (!place_meeting(x, y + sign(vsp), obj_solid)) {
		y = y + sign(vsp)
	}
	vsp = 0
}
y = y + vsp

function takeZaza() {
	wait_timer = 60
	is_taking_zaza = true	
}