 /// @description Insert description here

if (do_transition)
{
#region	//handle black/white fade/room transition
	if (room != spawn_room)
	{
		t += 1/60
		white_alpha = ease("easeinoutcubic",t) //* amplify + offest;
		//white_alpha += 0.05
		if (white_alpha >= 1)
		{
			room_goto(spawn_room)
		}
		
		if instance_exists(oParticle_Snow)
		{
			with oParticle_Snow
			{
				rm_end = true
			}
		}
	}
#endregion
}
else
{
	if white_alpha > 0
	{
		t2 += 1/60
		white_alpha = 1 - ease("easeinoutcubic",t2) //* amplify + offest;
	}
	if (white_alpha <= 0)
	{
		do_transition = false
	}
}
	
//drawing black/white fade
draw_set_alpha(white_alpha)
draw_set_color(make_color_rgb(255,255,255))
draw_rectangle(0,0,guiWidth,guiHeight,0)
draw_set_alpha(1)
