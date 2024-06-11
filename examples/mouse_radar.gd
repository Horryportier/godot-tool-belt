extends Node2D

@onready var radar: Radar2D = $Radar2D

func _ready():
	radar.body_tracked.connect(func(body: Node2D): var b = body as Enemy; b.resource.health.take_dmg(10))

func _process(_delta):
	global_position = get_global_mouse_position()
