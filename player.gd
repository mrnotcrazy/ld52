extends KinematicBody2D

var ready = true
export (int) var speed = 200
export (int) var jump_speed = -700
export (int) var gravity = 1800
var velocity = Vector2.ZERO
const UP = Vector2(0, -1)
export var bullet_speed = 1000
export var fire_rate = 0.2

var bullet = preload("res://bullet.tscn")
var can_fire = true



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
			print(is_on_floor())
			if is_on_floor():
				velocity.y = jump_speed
		get_node("hands").look_at(get_global_mouse_position())
		#shooting time
		if Input.is_action_pressed("fire") and can_fire:
			var bullet_instance = bullet.instance()
			bullet_instance.position = $hands.get_global_position()
			bullet_instance.rotation_degrees = $hands.rotation_degrees
			bullet_instance.apply_impulse(Vector2(bullet_speed, 0).rotated($hands.rotation), Vector2())
			get_tree().get_root().add_child(bullet_instance)
			can_fire = false
			get_node("firerate").start(.5)
			


func _on_firerate_timeout():
	can_fire = true
	pass # Replace with function body.
