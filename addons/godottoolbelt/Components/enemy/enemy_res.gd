extends GameCharacterRes
class_name EnemyRes

func print_debug_info():
	print("name ",name)
	print("level ",level)
	print("groups ", groups.groups)

	print("max_health ",health.max_hp)
	print("start_health ",health.start_hp)
	print("hp ",health.hp)
	
	
