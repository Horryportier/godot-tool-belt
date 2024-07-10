class_name GameCharacterRes
extends Resource

@export var health: HealthRes

@export var level: int = 1

@export var name: String

@export var groups: GroupRes

@export var params: Dictionary

func setup(node: CharacterBody2D):
	health.setup()
	groups.setup(node)

