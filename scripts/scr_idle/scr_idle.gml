
//behaviour
	counter += 1;
	move_wander = 0
	
//transition triggers
if(counter >= room_speed * 3)
	{
		var change = choose(0,1);
		switch(change)
		{
			case 0: state = states.wander; break;
			case 1: counter = 0; break;
		}
	}
if(collision_circle(x,y, 1000, oPlayer, false, false))
	{
		state = states.alert; 
	}
	


//sprite
	//sprite_index = s_enemy_idle
	//image_xscale = sign(moveX);


