extends RigidBody2D

var explosiveIn = preload("res://bullets/explosion.tscn")
var dmg = -1



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


	



func destruct():
	var boom = explosiveIn.instance()
	boom.position=get_global_position()
	get_tree().get_root().add_child(boom)
	queue_free()

func _on_selfDestruct_timeout():
	destruct()
	pass # Replace with function body.

