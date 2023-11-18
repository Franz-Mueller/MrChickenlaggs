/// @description controls player movement

// check keyboard input related to walking direction
move_right = keyboard_check(ord("A"));
move_left = keyboard_check(ord("D"));
move_up = keyboard_check(ord("W"));
move_down = keyboard_check(ord("S"));

var _shiftinput = keyboard_check(vk_shift);

// calculate speedfactor
speed_factor_total = speed_base; 
if _shiftinput speed_factor_total = speed_factor_total + speed_factor_sprint;

// set player speed
speed_total = speed_base * speed_factor_total

// calculate Speed on Axis
vx = ((move_left - move_right) * speed_total);
vy = ((move_down - move_up) * speed_total);

// set sprite animation depending on direction the character looks
if (vx==0 && vy == 0) {
	switch dir {
		case 0: sprite_index = spr_player_idle_right; break; // right
		case 1:	sprite_index = spr_player_idle_up; break; // up
		case 2:	sprite_index = spr_player_idle_left; break; // left
		case 3:	sprite_index = spr_player_idle_down; break; // down
	}
}

// manage animations and move
if (vx != 0 || vy != 0) {
	
	move_and_collide(vx, vy, [obj_tree_group_1]);
	
	if (vx > 0) {
		sprite_index = spr_player_walking_right;
		dir = 0;
	}
	if (vx < 0) {
		sprite_index = spr_player_walking_left;
		dir = 2;
	}
	if (vy > 0) {
		sprite_index = spr_player_walking_down;
		dir = 3;
	}
	if (vy < 0) {
		sprite_index = spr_player_walking_up;
		dir = 1;
	}
}
