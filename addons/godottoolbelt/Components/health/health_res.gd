extends Resource
class_name HealthRes

@export var max_hp = 0
@export var start_hp = 0
@export var debug = false

var old_hp = 0

var hp = 0:
	set (val):
		if debug:
			print(hp," -> ", val)
		hp = clampi(val, 0 , max_hp)
		if old_hp == hp:
			return
		hp_changed.emit()
		if hp == 0:
			hp_zero.emit()
		if hp == max_hp:
			hp_max.emit()
	


signal hp_changed
signal hp_decresed(amount: int)
signal hp_incised(amount: int)
signal hp_zero
signal hp_max

func setup():
	if start_hp > 0:
		hp  = start_hp
	else:
		hp  = max_hp
	hp_changed.connect(on_hp_changed)

func get_hp():
	return hp

func on_hp_changed():
	if old_hp < hp:
		hp_incised.emit(hp - old_hp)
	if old_hp > hp:
		hp_decresed.emit(old_hp - hp)
	old_hp = hp

func take_dmg(amount):
	hp -= amount
	hp_decresed.emit(amount)

func heal(amount):
	hp += amount
	hp_incised.emit(amount)

func reset():
	hp = max_hp

