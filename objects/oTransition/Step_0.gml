/// @description Insert description here
// You can write your code in this editor

if button = true
{
	/*
	//200px wide button
	if mouse_x > x-100 && mouse_x < x+100 && mouse_y > y-100 && mouse_y < y+100
	{
		if mouse_check_button_released(mb_left)
		{
			button_pressed = true
		}
	}
	*/
	if position_meeting(mouse_x,mouse_y,self)
	{
		if mouse_check_button_released(mb_left)
		{
			button_pressed = true
		}
	}
}