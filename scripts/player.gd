extends CharacterBody2D

@export var input: InputComponent
@export var movement: MoveComponent


func _ready() -> void:
	input.direction_changed.connect(movement.set_direction)
