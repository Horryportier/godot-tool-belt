extends Enemy

@onready var dmg: Button = $Dmg
@onready var heal: Button = $Heal
@onready var icon: Sprite2D = $Icon
@onready var icon_material: Material

var selected = false

func setup():
	dmg.pressed.connect(func():  resource.health.take_dmg(10))
	heal.pressed.connect(func():  resource.health.heal(10))
	icon_material = icon.material

func _process(_delta):
	if not selected:
		icon.material = null
	else :
		icon.material = icon_material
