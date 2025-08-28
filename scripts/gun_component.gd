extends Node2D
class_name GunComponent

@export var bullet_scene: PackedScene
@export var shoot_cd: float


func update_aim(direction: Vector2) -> void:
	look_at(direction)

func shoot_gun() -> void:
	var bullet: bullet = bullet_scene.instantiate()
	
