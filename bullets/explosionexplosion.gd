extends RigidBody2D

var explosiveIn = preload("res://bullets/explosion.tscn")
var explosiveInBig = preload("res://bullets/explosion_big.tscn")

var dmg = -1
export (bool) var bigboom=false


# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


	



func destruct():
	
	call_deferred("die")
	

func _on_selfDestruct_timeout():
	destruct()
	pass # Replace with function body.

func die():
	if bigboom:
		var boom = explosiveIn.instance()
		boom.position=get_global_position()
		get_tree().get_root().add_child(boom)
		queue_free()
	else:
		var boom = explosiveInBig.instance()
		boom.position=get_global_position()
		get_tree().get_root().add_child(boom)
		queue_free()
