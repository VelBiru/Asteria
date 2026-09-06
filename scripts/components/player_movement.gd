class_name Movement extends Component

@export var speed := 240.0
@export var sprint_speed := 400.0

@export var jump_height := 30.0
@export var jump_duration := 0.5

@export var dash_speed := 500.0
@export var dash_duration := 0.15

@export var appearance: Node2D
@export var collision: CollisionShape2D

var jump_timer := 0.0
var jump_offset := 0.0
var dash_timer := 0.0

var is_jumping := false
var is_dashing := false

var dash_direction := Vector2.ZERO
var facing_direction := Vector2.DOWN

func get_direction() -> Vector2:
	return Input.get_vector(
		"move_left",
		"move_right",
		"move_up",
		"move_down"
	)

func update_facing() -> void:
	var direction := get_direction()

	if direction != Vector2.ZERO:
		facing_direction = direction.normalized()

func move() -> void:
	if is_dashing:
		return

	update_facing()

	var direction := get_direction()

	entity.velocity = direction * speed
	entity.move_and_slide()


func sprint() -> void:
	if is_dashing:
		return

	update_facing()

	var direction := get_direction()

	entity.velocity = direction * sprint_speed
	entity.move_and_slide()


func dash() -> void:
	if is_dashing:
		return

	var direction := get_direction()

	if direction == Vector2.ZERO:
		direction = facing_direction

	dash_direction = direction.normalized()
	is_dashing = true
	dash_timer = dash_duration

func jump() -> void:
	if is_jumping:
		return

	is_jumping = true
	jump_timer = 0.0
	jump_offset = 0.0

func apply_jump() -> void:
	appearance.position.y = -jump_offset
	collision.position.y = -jump_offset

func update_jump(delta: float) -> void:
	if not is_jumping:
		return

	jump_timer += delta

	var progress := jump_timer / jump_duration
	progress = clamp(progress, 0.0, 1.0)

	jump_offset = sin(progress * PI) * jump_height

	apply_jump()

	if progress >= 1.0:
		jump_offset = 0.0
		jump_timer = 0.0
		is_jumping = false

		apply_jump()

func update_dash(delta: float) -> void:
	if not is_dashing:
		return

	dash_timer -= delta

	entity.velocity = dash_direction * dash_speed
	entity.move_and_slide()

	if dash_timer <= 0.0:
		dash_timer = 0.0
		is_dashing = false

func _physics_process(delta: float) -> void:
	
		
	if is_jumping:
		update_jump(delta)

	if is_dashing:
		update_dash(delta)
	
	
	if not is_dashing:
		return
	
	
	entity.velocity = dash_direction * dash_speed
	entity.move_and_slide()
	
