extends Label
var newsline1s=["New miracle crops put military industrial complex out of business! Guns and Ammo now grow on trees! What will be next??!!!",
"In Brazil an industrius farmer has taken up Gene editing in his free time and created a tomato that tastes like bacon.... it also shoots rockets lol",
"Bill gates bans user 69xxxmothermaster from all microsoft services forever after the user insults his son on xbox live",
"Activists question whether growing explosive or dangerous plants is a good idea, we say it is cause we are paid to say that",
"Tonight we speak with Genetic scientist Dr.Gumpy Stumpkins, The important questions you want to know...... If we can grow guns on trees why can't I have laser eyes?"
,"Channel 5 says out of sync audio not a sign of incompetent audio editor but is actually a time space anomaly. Really for sure not just someone in a time crunch."	,
"Enviromentalist say they are confused why they have to explain why growing bombs on trees would be bad.",
"A family in New Mexico was blown sky High after the parents attempted to cook explosive eggplants",
"Elon must says Tesla is also getting into the veggie bomb market, Critics say lol good luck",
"Famed developer Mrnotcrazy says girlfriend not interested in playing game about exploding plants, some say she will eventually come around... Other say... probably not",
"mother tells famed developer Mrnotcrazy she wished he could put mario in her games",
"Albert Einstien comes back from the dead to tell America that growing bullets on trees is stupid AF",
"Boyfriend won't shut up about gamejams so girlfirend Ctrl-alt-del's him, Scientists say they have no idea how TF that works"
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
