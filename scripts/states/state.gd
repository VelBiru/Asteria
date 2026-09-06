class_name State extends Node

var entity: Entity
var state_machine: StateMachine
var controller: StateController

func setup(owner: Entity, machine: StateMachine) -> void:
	entity = owner
	state_machine = machine
	
	controller = StateController.new()
	add_child(controller)
	controller.setup(self)

func enter() -> void:
	pass


func exit() -> void:
	pass


func update(_delta: float) -> void:
	pass


func physics_update(_delta: float) -> void:
	pass
