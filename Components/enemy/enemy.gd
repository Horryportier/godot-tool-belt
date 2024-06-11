extends CharacterBody2D
class_name Enemy

@export var resource: EnemyRes

@export var debug: bool


func _ready():
	setup()
	resource.setup(self)
	if debug:
		resource.print_debug_info()

## Setup enemy here
func setup():
	pass 


