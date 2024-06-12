extends Resource
class_name EnemyRes

@export var health: HealthRes

@export var level: int = 1

@export var name: String

@export var groups: GroupRes

func setup(node: CharacterBody2D):
	health.setup()
	groups.setup(node)

func print_debug_info():
	print("name ",name)
	print("level ",level)
	print("groups ", groups.groups)

	print("max_health ",health.max_hp)
	print("start_health ",health.start_hp)
	print("hp ",health.hp)
	
	
