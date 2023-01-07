extends Label
var newsline1s=["New miracle crops put military industrial complex out of business! Guns and Ammo now grow on trees! What will be next??!!!",
"In Brazil an industrius farmer has taken up Gene editing in his free time and created a tomato that tastes like bacon.... it also shoots rockets lol",
"Bill gates bans user 69xxxmothermaster from all microsoft services forever after the user insults his son on xbox live",
"Activists question whether growing explosive or dangerous plants is a good idea, we say it is cause we are paid to say that",
"Tonight we speak with Genetic scientist Dr.Gumpy Stumpkins, The important questions you want to know...... If we can grow guns on trees why can't I have laser eyes?"
	
]
var activeLines=newsline1s

func _physics_process(delta):
	if get_position().x>=-2000:
		set_position(Vector2(get_position().x-1,255))
		
		pass
	else:
		set_position(Vector2(450,255))
		updateText()
	

# Called when the node enters the scene tree for the first time.
func _ready():
	updateText()
	#scroll()
	pass # Replace with function body.

func scroll():
	
	
		
	pass

func updateText():
	var randText = activeLines[randi() % activeLines.size()]
	text=randText
	
	pass
