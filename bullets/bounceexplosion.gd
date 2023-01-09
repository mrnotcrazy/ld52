extends RigidBody2D

var explosiveIn = preload("res://bullets/explosion.tscn")
var dmg = -1
var hits =0 


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


	



func destruct():
	if hits !=2:
		call_deferred("explode")
		
	else:
		queue_free()
	hits+=1
func _on_selfDestruct_timeout():
	destruct()
	pass # Replace with function body.



func explode():
	var boom = explosiveIn.instance()
	boom.position=get_global_position()
	get_tree().get_root().add_child(boom)
	
