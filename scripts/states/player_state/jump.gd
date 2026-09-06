class_name JumpState extends State

var movement: Movement

func enter() -> void:
	print("Entered Jump")
	movement.jump()

func setup(owner: Entity, machine: StateMachine) -> void:
	super.setup(owner, machine)
	movement = entity.get_component(Movement)

func physics_update(delta: float) -> void:
	
	if controller.dash():
		return

	if movement.get_direction() != Vector2.ZERO:
		if Input.is_action_pressed("sprint"):
			movement.sprint()
		else:
			movement.move()

	if movement.is_jumping:
		return

	if movement.get_direction() == Vector2.ZERO:
		controller.change_to("IdleState")
	elif Input.is_action_pressed("sprint"):
		controller.change_to("Sprint")
	else:
		controller.change_to("WalkState")
