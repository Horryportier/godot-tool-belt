class_name LocalHealthBar
extends ProgressBar

@onready var health: HealthRes = get_parent().resource.health

@export var smooth: bool = true
@export var tween_res: TweenRes 

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
	tween.tween_property(self, "value", final, tween_res.duration).set_ease(tween_res.ease_type).set_trans(tween_res.trans_type)
