class_name StateMachine extends Node

@export var initial_state: State

var current_state: State
var entity: Entity

func setup(owner: Entity) -> void:
	entity = owner
	
	for child in get_children():
		if child is State:
			print("FOUND STATE: ", child.name)
			child.setup(entity, self)

	if initial_state:
		change_state(initial_state)
	else:
		print("NO INITIAL STATE!")

func _process(delta: float) -> void:
	if current_state:
		current_state.update(delta)


func _physics_process(delta: float) -> void:
	if current_state:
		current_state.physics_update(delta)

func change_state(new_state: State) -> void:
	print("CHANGE STATE CALLED: ", new_state)

	if new_state == current_state:
		return

	if current_state:
		current_state.exit()

	current_state = new_state
	current_state.enter()
