if hp < 0
{
	draw_sprite(sExplosion,image_index,x,y)
}

draw_self()

{
	draw_set_font(fnt_health)
	draw_set_halign(0)
	draw_set_color(c_black)
	draw_text(x-10,y-110,hp)
	
	draw_healthbar(x-30,y-100,x+10,y-92,hp,0,c_red,c_green,0,0,0)
}
