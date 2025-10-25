extends CharacterBody2D

@onready var _health_label: Label = $HealthLabel
@onready var _coins_label: Label = $Coins

const MAX_HEALTH: int = 10

@export var max_speed: float = 500.0
@export var acceleration: float = 2500.0
@export var deceleration: float = 1500.0

@export var coins: int :
	get:
		return coins
	set(value):
		coins = clamp(value, 0, 101)
		update_coins()

@export var health: int = 10:
	get:
		return health
	set(new_value):
		health = clamp(new_value, 0, MAX_HEALTH)
		update_health()
	
func _ready():
	update_health()

func _physics_process(delta: float):
	var input_direction: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()
	

func update_coins():
	if not is_instance_valid(_coins_label):
		return
	_coins_label.text = str(coins)

func update_health():
	if not is_instance_valid(_health_label):
		return
	_health_label.text = str(health) + "/" + str(MAX_HEALTH)
	
func add_health(difference: int):
	health += difference
	
