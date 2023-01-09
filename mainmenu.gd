extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var viewSelect=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Start_button_down():
	get_tree().change_scene("res://level1.tscn")
	pass # Replace with function body.


func _on_howto_button_down():
	$howto/next.visible=true
	viewSelect=1
	$howto1.visible=true
	pass # Replace with function body.


func _on_next_button_down():
	viewSelect+=1
	match viewSelect:
		1:
			$howto1.visible=true
		2:
			$howto2.visible=true
		3:
			$howto3.visible=true
		4:
			$howto4.visible=true
		5: 
			$howto5.visible=true
		6:
			$howto5.visible=false
			$howto4.visible=false
			$howto3.visible=false
			$howto2.visible=false
			viewSelect=1
	pass # Replace with function body.
