extends RigidBody2D

var explosiveIn = preload("res://bullets/explosion.tscn")
var fragmentation = preload("res://bullets/penetrationpenetration.tscn")

var dmg = -1



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


	



func destruct():
	
	call_deferred("die")
	

func _on_selfDestruct_timeout():
	destruct()
	pass # Replace with function body.

func die():
	var boom = explosiveIn.instance()
	boom.position=get_global_position()
	get_tree().get_root().add_child(boom)
	queue_free()
	var spread=-.2
	
	for i in range(0,2):
		var bullet_instance = fragmentation.instance()
		bullet_instance.position =get_global_position()
		bullet_instance.rotation_degrees = rotation_degrees+spread
		bullet_instance.apply_impulse(Vector2(), Vector2(1000, 0).rotated(rotation+spread) )
		get_tree().get_root().add_child(bullet_instance)
		spread+=.1
	queue_free()
	
