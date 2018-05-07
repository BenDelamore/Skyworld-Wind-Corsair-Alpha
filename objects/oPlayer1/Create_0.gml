//Movement Variables
moveX = 0;
moveY = 0;

hspd = 0;
vspd = 0;

maxhspd = global.maxhspd;
maxvspd = global.maxvspd;

spd = sqrt(hspd*hspd + vspd*vspd)

//Miscellaneous Variables
hp = global.player_health

state = player_states.move

states_array[player_states.move] = scr_movement_3


sprites_array[0] = sPlayer


//Creation variables
if global.Weapon_Ballistae = true {instance_create_layer(x+64,y+2,"weapon_layer",oBallistae1)}

if global.WeaponBallistae2 = true {instance_create_layer(x+64,y+2,"weapon_layer",oBallistae2)}

if global.Weapon_Catapult = true {instance_create_layer(x,y+2,"weapon_layer",oCatapult1)}

instance_create_layer(x,y,"player_layer",oCameraTarget)


//Coin code?
if (collision_circle(x,y, 800, oCoin, false, false))
{
	oCoin.direction = point_direction(oCoin.x,oCoin.y,x,y)
	oCoin.speed = 1.5
}