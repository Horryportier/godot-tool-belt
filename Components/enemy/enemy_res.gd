extends Resource
class_name EnemyRes

@export var health: HealthRes

@export var level: int = 1

@export var name: String

@export var groups: Array[String]

func setup(node: CharacterBody2D):
	health.setup()
	setup_groups(node)

func setup_groups(node: CharacterBody2D):
	for group in groups:
		node.add_to_group(group)

func print_debug_info():
	print("name ",name)
	print("level ",level)
	print("groups ", groups)

	print("max_health ",health.max_hp)
	print("start_health ",health.start_hp)
	print("hp ",health.hp)
	
	
