class_name Hurtbox2D
extends Area2D


@onready var health: HealthRes = get_parent().resource.health

@export var eneble_iframes = false
@export var iframe_duration = 0.1

@export var debug = false

var enable = true

signal dmg_applied

func take_dmg(dmg: int) -> bool:
	if enable:
		if debug: printt("taken dmg", dmg)
		health.take_dmg(dmg)
		dmg_applied.emit()
		if eneble_iframes:
			enable = false
			get_tree().create_timer(iframe_duration).timeout.connect(func(): enable = true)
		return true
	return false
