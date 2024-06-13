class_name Hitbox2D
extends Area2D

@onready var damage: int = 10

@export var enable: bool = true

@export var damage_repeat  = false
@export var demage_repeat_timeout = 0.1

var _hurtboxes: Array[Hurtbox2D] = []


func _ready():
	area_entered.connect(_on_area_entered)
	area_exited.connect(_on_area_exited)
	if damage_repeat:
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = demage_repeat_timeout
		timer.one_shot = false
		timer.timeout.connect(repeat_damage)
		timer.start()

func _on_area_entered(area: Area2D):
	if not area is Hurtbox2D:
		return
	area.take_dmg(damage)
	if damage_repeat:
		_hurtboxes.push_back(area)

func _on_area_exited(area: Area2D):
	var index = _hurtboxes.find(area)
	if index >= 0:
		_hurtboxes.remove_at(index)

func repeat_damage():
	for hurtbox in _hurtboxes:
		hurtbox.take_dmg(damage)
