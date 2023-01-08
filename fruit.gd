extends Node2D
export(String, "bounce", "explosive", "penetration") var fruitType 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.

func initialize(type):
	
	match type:
		"bounce":
			$Sprite.texture=load("res://art/fruit_bounce_8x8_placeholder.png")
		"explosive":
			$Sprite.texture=load("res://art/fruit_explosive_8x8_placeholder.png")
		"penetration":
			$Sprite.texture=load("res://art/fruit_penetration_8x8_placeholder.png")
	fruitType=type
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.addFruit(fruitType)
		
		queue_free()
		pass
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
