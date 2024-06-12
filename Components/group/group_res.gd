class_name GroupRes
extends Resource


@export var groups: Array[String] = []

func setup(node: Node2D):
	for group in groups:
		node.add_to_group(group)
