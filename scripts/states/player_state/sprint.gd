class_name Sprint extends State

var movement: Movement


func setup(owner: Entity, machine: StateMachine) -> void:
	super.setup(owner, machine)
	movement = entity.get_component(Movement)


func enter() -> void:
	print("Entered Sprint")

func physics_update(_delta: float) -> void:
	
	if controller.jump():
		return

	if controller.dash():
		return

	if not Input.is_action_pressed("sprint"):
		if movement.get_direction() == Vector2.ZERO:
			controller.change_to("IdleState")
		else:
			controller.change_to("WalkState")

		return

	if movement.get_direction() == Vector2.ZERO:
		return

	movement.sprint()
	
func exit() -> void:
	print("Exited Sprint")
