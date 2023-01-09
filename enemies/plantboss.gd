extends KinematicBody2D
var dieSound = preload("res://death_effectqueen.tscn")
var babyUnit = preload("res://enemies/plant_enemy.tscn")
export var health =50
# Speed of the enemy
export var speed = 100
onready var playerNode=owner.get_node("player")

export var direction = 1

export var walk_distance = 400

# Current distance the enemy has walked
var current_distance = 0

func _physics_process(delta):
	
	
	# Check for collision and adjust position accordingly
	
	move_and_slide(Vector2(speed * direction, 0))
	
	# If the enemy has reached the end of its walk distance, turn around
	if abs(current_distance) >= walk_distance:
		direction *= -1
		current_distance = 0
	
	# Update current distance
	current_distance += speed * direction * delta
	if direction==0:
		$Sprite.flip_h=true
	else:
		$Sprite.flip_h=false
		pass

func _on_hurtPlayer_body_entered(body):
	if body.is_in_group("player"):
		body.updateHealth(-1)
		
		pass
	if body.is_in_group("bullet"):
		damage(body.dmg)	
		body.destruct()
	
	pass # Replace with function body.

func destruct():
	var death = dieSound.instance()
	get_tree().get_root().add_child(death)
	get_tree().change_scene("res://final.tscn")
	
func damage(x):
	print(health)
	health+=x
	if health<=0:
		destruct()


func _on_spawnBaby_timeout():
	
	var baby = babyUnit.instance()
	baby.position = $spawnPoint.get_global_position()
	
	get_tree().get_root().add_child(baby)
	pass # Replace with function body.


func _on_Timer_timeout():
	
	pass # Replace with function body.
