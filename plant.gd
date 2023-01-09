extends Node2D
export(String, "bounce", "explosive", "penetration") var fruitType 
var fruitScene = preload("res://fruit.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

				


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	var fruits=["bounce","explosive","penetration"]
	var rand_index:int = randi() % fruits.size()
	fruitType=fruits[rand_index]
	match fruitType:
		"bounce":
			$Sprite.modulate=Color(0,0,0)
		"explosive":
			$Sprite.modulate=Color(0.89,.34,.34)
		"penetration":
			$Sprite.modulate=Color(0,1,0)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_spawn_timeout():
	match fruitType:
		"bounce":
			#print("spawning")
			var fruit_instance = fruitScene.instance()
			fruit_instance.position = $spawnPoint.get_global_position()
			fruit_instance.initialize("bounce")
			get_tree().get_root().add_child(fruit_instance)
			#print(fruit_instance.position)
		"explosive":
			#print("spawning")
			var fruit_instance = fruitScene.instance()
			fruit_instance.position = $spawnPoint.get_global_position()
			fruit_instance.initialize("explosive")
			get_tree().get_root().add_child(fruit_instance)
		"penetration":
			#print("spawning")
			var fruit_instance = fruitScene.instance()
			fruit_instance.position = $spawnPoint.get_global_position()
			fruit_instance.initialize("penetration")
			get_tree().get_root().add_child(fruit_instance)
	$spawn.start(3)
	pass # Replace with function body.
