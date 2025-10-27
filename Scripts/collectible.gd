extends Node2D
class_name Collectible

func _on_area_2d_body_entered(body: Node2D):
	body.health += 5
	queue_free()
