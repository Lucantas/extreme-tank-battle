extends "res://Characters/Tank/Tank.gd"

var screen_size = 0

func ready():
	screen_size = get_viewport_rect().size

func get_input():
	rotation_speed = 1.5
	$Barrel.look_at(get_global_mouse_position())
	screen_size = get_viewport_rect().size
	rotation_dir = 0
	velocity = Vector2()
	if Input.is_action_pressed('ui_right'):
	    rotation_dir += 1
	if Input.is_action_pressed('ui_left'):
	    rotation_dir -= 1
	
	if Input.is_action_pressed('ui_down'):
	    velocity = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed('ui_up'):
	    velocity = Vector2(speed, 0).rotated(rotation)
	

	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

func handle_shoot():
	if Input.is_action_pressed("fire"):
		$Barrel/MuzzleFlash.show()
		$AnimationPlayer.play("muzzle-flash")
		
	if Input.is_action_just_released("fire"):
		$Barrel/MuzzleFlash.hide()
		$AnimationPlayer.stop()
	

func _physics_process(delta):
	get_input()
	handle_shoot()
	rotation += rotation_dir * rotation_speed * delta
	move_and_slide(velocity)
	
	
func _on_AnimationPlayer_finished():
	$AnimationPlayer.stop()