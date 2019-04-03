extends "res://Characters/Tank/Tank.gd"

func control(delta):
	$Barrel.look_at(get_global_mouse_position())