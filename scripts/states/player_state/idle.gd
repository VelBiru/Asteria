class_name IdleState extends State

var movement: Movement

func enter() -> void:
	print("Entered Idle")
	
func setup(owner: Entity, machine: StateMachine) -> void:
	super.setup(owner, machine)
	movement = entity.get_component(Movement)

func physics_update(_delta: float) -> void:
	
	if controller.jump():
		return

	if controller.dash():
		return
	
	if movement.get_direction() != Vector2.ZERO:
		state_machine.change_state(
			get_parent().get_node("WalkState")
		)
	
