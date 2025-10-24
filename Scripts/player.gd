extends Node2D

@onready var _health_label: Label = $HealthLabel

const MAX_HEALTH: int = 10

@export var health: int = 10

func _ready() -> void:
	update_health()

func add_health(difference: int):
	health += difference
	health = clamp(health, 0, MAX_HEALTH)
	
	update_health()
	
func update_health():
	_health_label.text = str(health) + "/" + str(MAX_HEALTH)
