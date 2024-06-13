extends Control

@onready var ista_heal: Button = $InstaHeal

func _ready():
	ista_heal.pressed.connect(_on_pressed)


func _on_pressed():
	var enemies = get_tree().get_nodes_in_group("Enemy") as Array[Enemy]
	for enemy in enemies:
		enemy.resource.health.hp = enemy.resource.health.max_hp
