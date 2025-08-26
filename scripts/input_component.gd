extends Node
class_name InputComponent

signal direction_changed(direction)
# Referencia automática al CharacterBody2D padre
@onready var body: CharacterBody2D = get_parent() as CharacterBody2D

func _ready() -> void:
	if not body:
		push_error("TopDownMover debe ser hijo directo de un CharacterBody2D")

func _physics_process(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	direction_changed.emit(input_vector)
