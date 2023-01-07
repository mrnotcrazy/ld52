extends Node2D

var health=5
export (Texture) var  heartArt=load("res://art/heart_16x16_placeholder.png")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	updateHealth(0)
	pass # Replace with function body.

func updateHealth(update):
	health+=update
	var hearts = get_node("player/Camera2D/CanvasLayer/UI/health").get_children()
	for n in hearts:
		$player/Camera2D/CanvasLayer/UI/health.remove_child(n)
		n.queue_free()
	for heart in health:
		var heartUI=TextureRect.new()
		heartUI.texture=heartArt
		$player/Camera2D/CanvasLayer/UI/health.add_child(heartUI)
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
