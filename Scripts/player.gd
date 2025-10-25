extends Node2D

@onready var _health_label: Label = $HealthLabel

const MAX_HEALTH: int = 10

@export var health: int = 10:
	get:
		return health
	set(new_value):
		health = clamp(new_value, 0, MAX_HEALTH)
		update_health()
	
func _ready():
	update_health()

func update_health():
	if not is_instance_valid(_health_label):
		return
	_health_label.text = str(health) + "/" + str(MAX_HEALTH)
	
func add_health(difference: int):
	health += difference
	
