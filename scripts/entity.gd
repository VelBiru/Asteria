class_name Entity extends CharacterBody2D

func _ready() -> void:
	_setup_components(self)


func _setup_components(node: Node) -> void:
	for child in node.get_children():

		if child is Component:
			child.setup(self)

		_setup_components(child)


func get_component(type: Variant) -> Component:
	return _find_component(self, type)


func _find_component(node: Node, type: Variant) -> Component:
	for child in node.get_children():

		if is_instance_of(child, type):
			return child

		var component := _find_component(child, type)

		if component:
			return component

	return null
