extends RigidBody2D

var explosiveIn = preload("res://bullets/explosion.tscn")
var dmg = -1



# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


	



func destruct():
	
	queue_free()

func _on_selfDestruct_timeout():
	destruct()
	pass # Replace with function body.



