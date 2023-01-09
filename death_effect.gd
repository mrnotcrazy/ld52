extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$soundPlayer.play()
	print("playing")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_soundPlayer_finished():
	print("done")
	
	queue_free()
	pass # Replace with function body.
