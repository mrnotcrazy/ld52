extends Node2D
export (float )var growth 
var dmg = -3
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Sprite.scale=$Sprite.scale+Vector2(.5,.5)
	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_updateAmmo_timeout():
	
	pass # Replace with function body.


func _on_StaticBody2D_body_entered(body):
	if body.is_in_group("enemy"):
		body.damage(dmg)
		pass
	pass # Replace with function body.
