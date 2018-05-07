
//run script movement
script_execute(states_array[state]);

#region //Stopping Player from exiting room

var edgespeed1 = (distance_to_point(x, global.edge))/100
var edgespeed2 = distance_to_point(y, global.edge)
var edgespeed3 = point_distance(x,x,room_width - global.edge,room_width - global.edge)
var edgespeed4 = point_distance(y,y,room_height - global.edge,room_height - global.edge)

//abs(sign(hspd))+

if x > room_width - global.edge
	{hspd -= 0.1 + edgespeed3}

if x < global.edge
	{hspd += max(0,(edgespeed1/10),abs(hspd))}

//abs(sign(vspd))+

if y > room_height - global.edge
	{vspd -= edgespeed4}

if y < global.edge
	{vspd += (0.1 +edgespeed2)}

/*
x = min(x, (room_width-global.edge));
x = max(x, (0+global.edge));
y = min(y, (room_height-global.edge));
y = max(y, (0+global.edge));

/*
if x =  room_width + 100
{
	x += sign(hspd + 0.02)
}
*/
#endregion

#region //Player Death
if hp < 0
{
	repeat random(8)
	{
		instance_create_layer(x,y,"projectiles_layer",oSpark)
	}

	image_alpha -= 0.05
}
if image_alpha = 0
{
	room_restart()
}
#endregion
