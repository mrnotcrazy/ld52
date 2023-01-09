extends RigidBody2D
var dmg = -2
var hits= 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func destruct():
	hits+=1
	if hits ==3:
		queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_selfDestruct_timeout():
	queue_free()
	pass # Replace with function body.
