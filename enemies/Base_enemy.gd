extends KinematicBody2D
var dieSound = preload("res://death_effect.tscn")
export var health =5
# Speed of the enemy
export var speed = 100
export (int) var gravity = 1800
var velocity = Vector2.ZERO
const UP = Vector2(0, -1)
# Direction the enemy is facing (1 = right, -1 = left)
export var direction = 1

# Distance the enemy will walk before turning around
export var walk_distance = 200

# Current distance the enemy has walked
var current_distance = 0

func _physics_process(delta):
	
	
	# Check for collision and adjust position accordingly
	
	velocity.y += gravity * delta
	move_and_slide(velocity,UP)
	move_and_slide(Vector2(speed * direction, 0))
	
	# If the enemy has reached the end of its walk distance, turn around
	if abs(current_distance) >= walk_distance:
		direction *= -1
		current_distance = 0
	
	# Update current distance
	current_distance += speed * direction * delta
	if direction==1:
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
	queue_free()

func damage(x):
	print(health)
	health+=x
	if health<=0:
		destruct()
