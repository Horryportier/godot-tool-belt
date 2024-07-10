@tool
extends Node3D

@onready var smoke: GPUParticles3D = $Smoke
@onready var flame: GPUParticles3D = $Flame
@onready var sparks: GPUParticles3D = $Sparks

@export var smoke_color:  Color = Color.BLACK
@export var flame_color:  Color = Color.RED
@export var sparks_color: Color = Color.YELLOW_GREEN

func _process(_delta):
	smoke.process_material.color = smoke_color
	flame.process_material.color = flame_color
	sparks.process_material.color = sparks_color
