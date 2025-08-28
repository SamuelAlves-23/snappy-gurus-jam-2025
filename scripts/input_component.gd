extends Node
class_name InputComponent

signal direction_changed(direction)
signal mouse_pos_changed(_mouse_pos)
signal shoot()
# Referencia automática al CharacterBody2D padre
@onready var body: CharacterBody2D = get_parent() as CharacterBody2D

var _input_vector: Vector2
var _mouse_pos: Vector2
var _prev_mouse_pos: Vector2

func _ready() -> void:
	if not body:
		push_error("Move Component debe ser hijo directo de un CharacterBody2D")

func _physics_process(delta: float) -> void:
	check_movement_input()
	check_mouse_input()


func check_movement_input() -> void:
	_input_vector = Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	direction_changed.emit(_input_vector)

func check_mouse_input() -> void:
	_mouse_pos = get_viewport().get_mouse_position()
	if _mouse_pos != _prev_mouse_pos:
		_prev_mouse_pos = _mouse_pos
		print(_mouse_pos)
		mouse_pos_changed.emit(_mouse_pos)
	if Input.is_action_just_pressed("shoot"):
		shoot.emit()
