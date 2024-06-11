extends Enemy

@onready var dmg: Button = $Dmg
@onready var heal: Button = $Heal

func setup():
	dmg.pressed.connect(func():  resource.health.take_dmg(10))
	heal.pressed.connect(func():  resource.health.heal(10))
