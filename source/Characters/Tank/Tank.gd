extends KinematicBody2D

export (float) var rotation_speed
export (int) var max_speed
export (int) var speed = 200

var velocity = Vector2()
var alive = true
var rotation_dir = 0