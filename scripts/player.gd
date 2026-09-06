class_name Player extends Entity

@onready var state_machine: StateMachine = $StateMachine


func _ready() -> void:
	print("PLAYER READY")

	super._ready()

	state_machine.setup(self)
