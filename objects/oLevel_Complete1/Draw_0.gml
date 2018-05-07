/// @description Insert description here
// You can write your code in this editor

draw_self()

draw_circle_color(x,y,512,c_white,c_white,true)

draw_set_halign(fa_left)
draw_set_valign(fa_middle)
draw_set_font(fnt_health)
draw_set_colour(c_white)

if place_meeting(x,y,oPlayer)
{
	image_alpha += 0.02
	draw_text(x,y-100,"Press 'Enter' to Continue")
}

