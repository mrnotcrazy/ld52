extends KinematicBody2D

var ready = true
export (int) var speed = 200
export (int) var jump_speed = -700
export (int) var gravity = 1800
var velocity = Vector2.ZERO
const UP = Vector2(0, -1)
export var bullet_speed = 10000
export var fire_rate = 0.2

var direction = 0


#a basic bullet type for testing
var bullet = preload("res://bullet.tscn")
#types of basic ammo: bounce, explosive, penetration
var bounceScene = preload("res://bullets/bounce.tscn")
var explosiveScene = preload("res://bullets/rocket.tscn")
var penetrationScene = preload("res://bullets/penetration.tscn")
#upgrade types: bouncing explosive, fragment explosive, bouncing penetration, and so forth
var bounceExplosiveScene=preload("res://bullets/bounceexplosion.tscn")
var bouncePenetrationScene=preload("res://bullets/bouncepenetration.tscn")
var bounceBounceScene=preload("res://bullets/bouncebounce.tscn")
var explosivePenetrationScene=preload("res://bullets/explosionpenetration.tscn")
var explosiveExplosiveScene=preload("res://bullets/explosionexplosion.tscn")
var penetrationPenetrationScene=preload("res://bullets/penetrationpenetration.tscn")

#start with some ammo
var clip=["explosive", "explosive", "explosive", "explosive"]
var chamber ="explosive"



var can_fire = true

func _ready():
	
	
	pass # Replace with function body.
	
func blend():
	if clip.size()>=2:
		var fruit=clip.slice(0,1)
		if fruit[0]=="bounce" and fruit[1]=="bounce":
			clip.pop_front()
			clip.pop_front()
			chamber="bouncebounce"
		if fruit[0]=="bounce" and fruit[1]=="explosive":
			clip.pop_front()
			clip.pop_front()
			chamber="bounceexplosive"
		if fruit[0]=="bounce" and fruit[1]=="penetration":
			clip.pop_front()
			clip.pop_front()
			chamber="bouncepenetration"
		if fruit[0]=="explosive" and fruit[1]=="bounce":
			clip.pop_front()
			clip.pop_front()
			chamber="bounceexplosive"
		if fruit[0]=="explosive" and fruit[1]=="explosive":
			clip.pop_front()
			clip.pop_front()
			chamber="explosiveexplosive"
		if fruit[0]=="explosive" and fruit[1]=="penetration":
			clip.pop_front()
			clip.pop_front()
			chamber="explosivepenetration"
		if fruit[0]=="penetration" and fruit[1]=="bounce":
			clip.pop_front()
			clip.pop_front()
			chamber="bouncepenetration"
		if fruit[0]=="penetration" and fruit[1]=="explosive":
			clip.pop_front()
			clip.pop_front()
			chamber="explosivepenetration"
		if fruit[0]=="penetration" and fruit[1]=="penetration":
			clip.pop_front()
			clip.pop_front()
			chamber="penetrationpenetration"
		owner.updateAmmo()
		
	pass

func updateHealth(x):
	owner.updateHealth(x)
	if x<0:
		$hurtSound.play()
	pass

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("move_right"):
		velocity.x += speed
		direction=0
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
		direction=1
	if direction==1:
		$playerSprite.flip_h=true
	else:
		$playerSprite.flip_h=false
		pass
func _physics_process(delta):
	if ready==true:
		get_input()
		velocity.y += gravity * delta
		move_and_slide(velocity,UP)
		
		
		velocity = velocity
		if Input.is_action_just_pressed("jump"):
			
			if is_on_floor():
				velocity.y = jump_speed
				#$jumpSound.play()
		get_node("hands").look_at(get_global_mouse_position())
		#shooting time
		if Input.is_action_pressed("fire") and can_fire:
			if chamber!="empty":
				var bullet_instance = ammoType().instance()
				owner.updateAmmo()
				bullet_instance.position = $hands.get_global_position()
				$shootSound.play()
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
		if Input.is_action_just_pressed("blend"):
			blend()
	
func ammoType():
	
	
	match chamber:
		"bounce":
			return bounceScene
		"explosive":
			return explosiveScene
		"penetration":
			return penetrationScene
		"bounceexplosive":
			return bounceExplosiveScene
		"bouncepenetration":
			return bouncePenetrationScene
		"bouncebounce":
			return bounceBounceScene
		"explosivepenetration":
			return explosivePenetrationScene
		"explosiveexplosive":
			return explosiveExplosiveScene
		"penetrationpenetration":
			return penetrationPenetrationScene
	
	
	
func _on_firerate_timeout():
	can_fire = true
	pass # Replace with function body.


func addFruit(fruit):
	if clip.size()<=3:
		clip.push_front(fruit)
		if chamber=="empty":
			chamber=clip.pop_front()
		
			
		owner.updateAmmo()
	pass



func _on_ammoUpdate_timeout():
	owner.updateAmmo()
	pass # Replace with function body.
