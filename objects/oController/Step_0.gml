/// @description Insert description here

#region //Quit --- escape
if keyboard_check_released(vk_escape)
{
	game_end()
}
#endregion

#region //Return to Menu --- backspace
if keyboard_check_released(vk_backspace)
{
	//room_goto(room_menu)
	if (!do_transition)
	{
		spawn_room = room_menu
		do_transition = true
	}
}
#endregion

#region //Restart --- space
if keyboard_check_released(vk_space)
{
	//room_restart()
	if (!do_transition)
	{
		white_alpha += 0.15
		if (white_alpha >= 1)
		{
			room_restart()
		}
		//do_transition = true
	}
}
#endregion
