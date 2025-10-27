extends Node2D

@export var camera_distance: float = 200
@export var position_interpolated_speed: float = 1.0

@onready var _player: CharacterBody2D = get_parent()

func _process(delta):
	var move_direction: Vector2 = _player.velocity.normalized()
	var target_position: Vector2 = move_direction * camera_distance
	
	position = position.lerp(target_position, position_interpolated_speed * delta)
