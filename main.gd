extends Node2D

var health=5
export (Texture) var  heartArt=load("res://art/heart_16x16_placeholder.png")
var  bounceUI=load("res://art/ammoUI_bounce_32x24_placeholder.png")
var  explosiveUI=load("res://art/ammoUI_explosive_32x24_placeholder.png")
var  penetrationUI=load("res://art/ammoUI_penetration_32x24_placeholder.png")

onready var playerNode=$player

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
	if health<=0:
		get_tree().reload_current_scene()
		pass
	pass

func updateAmmo():
	print("adding ammo")
	var ammoList=playerNode.clip
	print(ammoList)
	var ammoToClear =$player/Camera2D/CanvasLayer/UI/Ammo_container.get_children()
	for each in ammoToClear:
		$player/Camera2D/CanvasLayer/UI/Ammo_container.remove_child(each)
		each.queue_free()
		pass
		
	for ammo in ammoList:
		var ammoUI=TextureRect.new()
		match ammo:
			"bounce":
				ammoUI.texture=bounceUI
			"explosive":
				ammoUI.texture=explosiveUI
			"penetration":
				ammoUI.texture=penetrationUI
		$player/Camera2D/CanvasLayer/UI/Ammo_container.add_child(ammoUI)
	
	match playerNode.chamber:
		"bounce":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_bounce_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Bounce"
		"explosive":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_explosive_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Explosive"
		"penetration":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_penetration_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Penetration"
		"explosiveexplosive":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_explosiveexplosive_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Big Boom"
		"penetrationpenetration":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_penetrationpenetration_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="ShotGun"
		"bouncebounce":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_bouncebounce_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Triple Bounce"
		"bounceexplosive":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_bounceexplosive_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Bouncing Betsie"
		"bouncepenetration":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_bouncepenetration_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="bouncing spikeball"
		"explosivepenetration":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/ammoChamber_explosivepenetration_32x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="Fragmentation"
		"empty":
			$player/Camera2D/CanvasLayer/UI/chamber_art/ammo_display.texture=load("res://art/enemy_base_16x32_placeholder.png")
			$player/Camera2D/CanvasLayer/UI/ammo_desc.text="EMPTY"
			
			
	pass

