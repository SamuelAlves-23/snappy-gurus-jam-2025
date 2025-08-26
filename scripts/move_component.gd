# TopDownMover.gd
extends Node
class_name MoveComponent

@export var speed: float = 200.0

# Dirección a seguir (debe establecerse desde fuera)
var direction: Vector2 = Vector2.ZERO

# Referencia automática al CharacterBody2D padre
@onready var body: CharacterBody2D = get_parent() as CharacterBody2D

func _ready() -> void:
	if not body:
		push_error("TopDownMover debe ser hijo directo de un CharacterBody2D")

func _physics_process(delta: float) -> void:
	if not body:
		return
	
	body.velocity = direction.normalized() * speed
	body.move_and_slide()

func set_direction(new_direction: Vector2) -> void:
	direction = new_direction
