/// @description Setup movement

movement_speed = 150 // per second
diagonal_speed = movement_speed / sqrt(2) // per second
last_velocity = []
dash = false
angle = 0

enum weapon {
	sword = obj_sword,
	laser_cannon = obj_laser_cannon,
	rocket_launcher = obj_rocket_launcher,
	axe = obj_axe,
	none = noone
}

enum interaction {
	up = 90,
	down = 270,
	left = 180,
	right = 0,
	none = -1
}

if (!is_undefined(SOUND_MENU) && audio_is_playing(SOUND_MENU)) {
	audio_stop_sound(SOUND_MENU)	
	SOUND_MENU = undefined
}

if (is_undefined(SOUND_GAME)) {
	SOUND_GAME = audio_play_sound(snd_game, 1, true)
}

last_interaction = interaction.none
current_interaction = interaction.none
can_use_weapon = true
current_weapon = weapon.none
won = false

var layer_id = layer_get_id("Collision")
collision_tile_map_id = layer_tilemap_get_id(layer_id)

gamepad_set_axis_deadzone(0, 0.4)