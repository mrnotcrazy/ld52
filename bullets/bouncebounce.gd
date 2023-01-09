extends Node2D
var pellet=preload("res://bullets/bounce.tscn")
export var bullet_speed = 1000
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("shotty")
	
	pass # Replace with function body.



func shotty():
	var spread=-.2
	print("shotty",rotation_degrees)
	for i in range(0,2):
		var bullet_instance = pellet.instance()
		bullet_instance.position =.get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees+spread
		bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated(rotation+spread) )
		get_tree().get_root().add_child(bullet_instance)
		spread+=.1
	queue_free()
	pass
