extends CharacterBody2D

@export var input: InputComponent
@export var movement: MoveComponent
@export var gun: GunComponent

func _ready() -> void:
	input.direction_changed.connect(movement.set_direction)
	input.mouse_pos_changed.connect(gun.update_aim)
	input.shoot.connect(gun.shoot_gun)
