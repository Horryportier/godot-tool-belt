class_name LocalHealthBar
extends ProgressBar

@onready var health: HealthRes = get_parent().resource.health

@export var smooth: bool = true
@export var drag: float = 0.1
@export var tras_type: Tween.TransitionType
@export var ease_type: Tween.EaseType

func _ready():
	value = remap(30, 0, health.max_hp, 0, 100)
	health.hp_changed.connect(_on_hp_changed)

func _on_hp_changed():
	if smooth:
		smooth_trans(int(remap(health.hp, 0, health.max_hp, 0, 100)))
	else:
		value = remap(health.hp, 0, health.max_hp, 0, 100)


func smooth_trans(final: int):
	var tween = create_tween()
	tween.tween_property(self, "value", final, drag).set_ease(ease_type).set_trans(tras_type)
