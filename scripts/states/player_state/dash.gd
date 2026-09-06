class_name Dash extends State

var movement: Movement

func setup(owner: Entity, machine: StateMachine) -> void:
	super.setup(owner, machine)
	movement = entity.get_component(Movement)

func enter() -> void:
	print("Entered Dash")
	movement.dash()

func physics_update(_delta: float) -> void:
	
	if movement.is_dashing:
		return

	# Dash finished, but jump is still happening
	if movement.is_jumping:
		state_machine.change_state(
			get_parent().get_node("JumpState")
		)
		return

	var direction := movement.get_direction()

	if direction == Vector2.ZERO:
		state_machine.change_state(
			get_parent().get_node("IdleState")
		)
		return

	if Input.is_action_pressed("sprint"):
		state_machine.change_state(
			get_parent().get_node("Sprint")
		)
		return

	state_machine.change_state(
		get_parent().get_node("WalkState")
	)


func exit() -> void:
	print("Exited Dash")
