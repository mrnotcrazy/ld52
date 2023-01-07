extends KinematicBody2D

var ready = true
export (int) var speed = 200
export (int) var jump_speed = -700
export (int) var gravity = 1800
var velocity = Vector2.ZERO
const UP = Vector2(0, -1)
export var bullet_speed = 10000
export var fire_rate = 0.2


#a basic bullet type for testing
var bullet = preload("res://bullet.tscn")
#types of basic ammo: bounce, explosive, penetration
var bounceScene = preload("res://bullets/bounce.tscn")
var explosiveScene = preload("res://bullets/rocket.tscn")
var penetrationScene = preload("res://bullet.tscn")
#upgrade types: bouncing explosive, fragment explosive, bouncing penetration, and so forth
var bounceExplosiveScene=preload("res://bullet.tscn")
var bouncePenetrationScene=preload("res://bullet.tscn")
var bounceBounceScene=preload("res://bullet.tscn")
var explosivePenetrationScene=preload("res://bullet.tscn")
var explosiveExplosiveScene=preload("res://bullet.tscn")
var penetrationPenetrationScene=preload("res://bullet.tscn")

#start with some ammo
var clip=["bounce", "explosive", "penetration"]
var chamber ="bounce"



var can_fire = true

func _ready():
	
	#scroll()
	pass # Replace with function body.
	


func updateHealth(x):
	owner.updateHealth(x)
	pass

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed

func _physics_process(delta):
	if ready==true:
		get_input()
		velocity.y += gravity * delta
		move_and_slide(velocity,UP)
		
		
		velocity = velocity
		if Input.is_action_just_pressed("jump"):
			
			if is_on_floor():
				velocity.y = jump_speed
		get_node("hands").look_at(get_global_mouse_position())
		#shooting time
		if Input.is_action_pressed("fire") and can_fire:
			if chamber!="empty":
				var bullet_instance = ammoType().instance()
				owner.updateAmmo()
				bullet_instance.position = $hands.get_global_position()
				bullet_instance.rotation_degrees = $hands.rotation_degrees
				bullet_instance.apply_impulse(Vector2(), Vector2(bullet_speed, 0).rotated($hands.rotation) )
				get_tree().get_root().add_child(bullet_instance)
				can_fire = false
				get_node("firerate").start(.5)
				if clip.size()!=0:
					chamber=clip.pop_front()
				else: 
					chamber="empty"
				owner.updateAmmo()
			#print("chamber"+chamber,"clip", clip)
func ammoType():
	
	
	match chamber:
		"bounce":
			return bounceScene
		"explosive":
			return explosiveScene
		"penetration":
			return penetrationScene
		"bounceExplosive":
			return bounceExplosiveScene
		"bouncePenetration":
			return bouncePenetrationScene
		"bounceBounce":
			return bounceBounceScene
		"explosivePenetration":
			return explosivePenetrationScene
		"explosiveExplosive":
			return explosiveExplosiveScene
		"penetrationPenetration":
			return penetrationPenetrationScene
	
	
	
func _on_firerate_timeout():
	can_fire = true
	pass # Replace with function body.
