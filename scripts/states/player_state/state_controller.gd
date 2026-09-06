class_name StateController extends Node

var state: State

func setup(owner_state: State) -> void:
	state = owner_state

func change_to(state_name: String) -> void:
	state.state_machine.change_state(
		state.get_parent().get_node(state_name)
	)

func jump() -> bool:
	if Input.is_action_just_pressed("jump"):
		change_to("JumpState")
		return true

	return false


func dash() -> bool:
	if Input.is_action_just_pressed("dash"):
		change_to("Dash")
		return true

	return false


func sprint() -> bool:
	if Input.is_action_pressed("sprint"):
		change_to("Sprint")
		return true

	return false


func stop_sprint() -> bool:
	if not Input.is_action_pressed("sprint"):
		return true

	return false
