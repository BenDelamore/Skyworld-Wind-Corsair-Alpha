/// @description ALL THE CODE!!

#region //Path Following
if mode = "patrol"
{
	if (point_distance(x,y,oPlayer.x,oPlayer.y) < 1000)
	{
		path_end();
		//mp_potential_step_object(player_x,player_y,spd,oSolid);
		mode = "chase"
	}
	else if (path_index != set_path)
	{
		mp_potential_step(start_x,start_y,spd,false);
	
		if (abs(x - start_x) < 3 && abs(y - start_y) < 3)
		{
			path_start(set_path,spd,path_action_continue,false);
		}
	}
	
		/*
		start_x = path_position.x
		start_y = path_position.y
		*/
	
	/*
	var nearpath = instance_nearest(x,y,oEnemy_path)
	if !place_meeting(x,y,nearpath)
	{
		var pathX = nearpath.x
		var pathY = nearpath.y
	
		dir = point_direction(x,y,pathX,pathY)
	}
	*/
	
}
#endregion

#region
if mode = "idle"
{
	counter += 1
	
	move_wander = 0
	if (counter >= room_speed * 3)
	{
		var change = choose(0,1);
		switch(change)
		{
			case 0: 
				counter = 0
				break;
			case 1:
				mode = "wander";
				counter = 0
				break;
			break;
		}
	}
}
#endregion

#region //Wander
if mode = "wander"
{
	counter += 1
	/*
	if ceil(random(100)) = true
	{
		dir = random(360)
	}
	direction = dir
	*/
	
	//transition triggers
	if (counter >= room_speed * 3)
	{
		var change = choose(0,1);
		switch(change)
		{
			case 0: 
				mode = "idle";
				break;
			case 1:
				move_wander = 1
				dir = irandom_range(0,359);
				counter = 0;
			break;
		}
	}
	if move_wander = 1
	{
		x += lengthdir_x(spd,dir)
		y += lengthdir_y(spd,dir)
	}

	if collision_circle(x,y,1000,oPlayer,0,0)
	{
		mode = "chase"
	}
	
	if set_path != noone
	{
		mode = "patrol"
	}
}
#endregion

#region //Chase Player
if mode = "chase"
{
	speed = 0
	
	//default settings  = mp_potential_settings(30,10,3,1)
	//mp_linear_step(oPlayer.x,oPlayer.y,6,0)
	mp_potential_step(oPlayer.x,oPlayer.y,spd,0)
	
	if !collision_circle(x,y,1200,oPlayer,0,0)
		{
			mode = "wander"
		}

	if collision_circle(x,y,500,oPlayer,0,0)
	{
		mode = "shoot"
	}
}
#endregion


#region //shooting
if mode = "shoot"
{
	dir  = point_direction(x,y,oPlayer.x,oPlayer.y)
//	dir = point_direction(x,y,random_range(oPlayer.x + 5,oPlayer.x - 5),random_range(oPlayer.y - 5,oPlayer.y + 5))
	
	if bullet_timer >= 1
	{
/*
		bullet = instance_create_layer(x,y,"projectiles_layer",oEnemy_projectile)
		bullet.direction = dir
		bullet.speed = 15
*/
		with (instance_create_layer(x - 15, y - 10, "projectiles_layer", oEnemy_projectile))
		{
			speed = 12;
			direction = point_direction(x,y,random_range(oPlayer.x + 5,oPlayer.x - 5),random_range(oPlayer.y - 5,oPlayer.y + 5))
		}
		bullet_timer = 0
	}
	
	if bullet_timer < 1
	{
		bullet_timer += 0.02
	}
	
	if !collision_circle(x,y,500,oPlayer,0,0)
	{
		mode = "chase"
	}
}
#endregion

#region //image direction
image_angle = 0 

/*
if speed != 0
{
	image_xscale = sign(speed)
}
*/

if direction = clamp(direction,90,270)
{
	image_xscale = 1
}
else if direction = clamp(direction,-90,90)
{
	image_xscale = -1
}
else
{
	image_xscale = 1
}
#endregion

#region //knockback mode
if mode = "knockback"
{
	if knockback_timer >= 1
	{
		mode = "chase"
	}
	
	knockback_timer += 1
}
#endregion

#region //Room Borders
x = max(x, global.edge);
x = min(x, room_width-global.edge);
y = max(y, global.edge);
y = min(y, room_height-global.edge);
#endregion

#region //death
if hp <= 0
{
	bullet_timer = -1000
	flame_frame += 0.2
	/*
	flame_frame = clamp(flame_frame,0,sprite_get_number(sExplosion)) 	
	repeat random(10)
	{
		instance_create_layer(x,y,"projectiles_layer",oSpark)
	}
	*/
	if flame_frame <= 0.2
	{
		repeat random(2)
		{
			instance_create_layer(x,y,"projectiles_layer",oCoin)
		}
	}
	//Explosion Code!!!	
	if death_timer <= 1
	{
		with instance_create_layer(x,y,"projectiles_layer",oExplosion)
		{
			image_angle = random_range(0,360)
			image_speed = 1
		}
	}
	image_alpha -= 0.25	

	death_timer += 1	
	if death_timer >= (sprite_get_number(sExplosion) * 5)
	{
		instance_destroy()
	}
}
#endregion
