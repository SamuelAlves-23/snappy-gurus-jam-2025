extends Resource
class_name BaseBulletStrategy

@export var bullet_speed: float
@export var bullet_damage: float
@export var texture: Texture2D


func _collided(boStaticBody2D) -> void:
	pass
