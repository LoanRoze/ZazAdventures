PIXEL = 32
REFRESH_PER_SEC = 60

// Mouvement
base_move_speed = 0.13 * PIXEL
move_speed = base_move_speed;
move_deflecator_percentage_in_percents_while_in_the_action_of_taking_zaza = 0.6
move_upgraded_by_zaza = base_move_speed * 1.1

base_jump_speed = -0.6 * PIXEL
jump_speed = base_jump_speed
jump_upgraded_by_zaza = base_jump_speed - 6

base_wall_jump_hsp = base_move_speed 
wall_jump_hsp = base_move_speed * 8
wall_jump_vsp = base_jump_speed * 0.4

wall_jump_active = false	
wall_jump_timer = 0;
wall_jump_duration = 20; // nombre de frames de poussée
wall_jump_dir = 0;

wall_slide_speed = 2

grav = 0.45

// timers et cooldown
current_cooldown_taking_zaza = 0
cooldown_taking_zaza = REFRESH_PER_SEC * 1.5
is_taking_zaza = false

current_cooldown_under_zaza = 0
cooldown_under_zaza = REFRESH_PER_SEC * 20 + cooldown_taking_zaza
is_under_zaza = false

vision = 1;
target_vision = 1
zaza_vision = 1.5

function countDown(current_cooldown) {
	if (current_cooldown > 0) {
		current_cooldown -= 1;
		return {
			is_in_state: true, 
			cooldown: current_cooldown
		}
	} else {
		return {
			is_in_state: false, 
			cooldown: current_cooldown
		}
	}
}

// Vitesse
hsp = 0;
vsp = 0;

