class_name WalkState extends State

var movement: Movement

func enter() -> void:
	print("Entered Walk")

func setup(owner: Entity, machine: StateMachine) -> void:
	super.setup(owner, machine)

	movement = entity.get_component(Movement)

func physics_update(_delta: float) -> void:
	
	if controller.jump():
		return

	if controller.dash():
		return

	if Input.is_action_pressed("sprint"):
		controller.change_to("Sprint")
		return

	if movement.get_direction() == Vector2.ZERO:
		controller.change_to("IdleState")
		return
		
	movement.move()
