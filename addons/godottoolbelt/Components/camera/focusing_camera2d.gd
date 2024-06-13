class_name FocusingCamera2D
extends Camera2D

var focus_node: Node2D

@export var tween_res = TweenRes

signal focus_changed



func focus_on(node: Node2D):
	if node != focus_node:
		focus_node = node
		focus_changed.emit()

func  _process(_delta):
	if focus_node != null:
		var tween = create_tween()
		tween.tween_property(self, "global_position", focus_node.global_position, tween_res.duration).set_ease(tween_res.ease_type).set_trans(tween_res.trans_type)
