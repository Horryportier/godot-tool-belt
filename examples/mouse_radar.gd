extends Node2D

@onready var radar: Radar2D = $Radar2D

@onready var camera: FocusingCamera2D = $"../FocusingCamera2D"


func _process(_delta):
	global_position = get_global_mouse_position()

	if Input.is_action_just_pressed("select") and radar.bodies.size() > 0:
		camera.focus_on(radar.bodies[0])
		

