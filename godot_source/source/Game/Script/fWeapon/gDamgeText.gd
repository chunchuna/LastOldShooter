extends Node2D
#dmg_text.get
onready var dmg_lable =$Control/dmgLable
onready var animation_:AnimationPlayer =$AnimationPlayer

func set_dmg(dmg):
	dmg_lable.bbcode_text="-[color=yellow]"+str(dmg)
func _ready():
	#position+=Vector2(0,-20)
	animation_.play("dmg_text")
	pass
	


func _on_Timer_timeout():
   
	queue_free()
	pass
