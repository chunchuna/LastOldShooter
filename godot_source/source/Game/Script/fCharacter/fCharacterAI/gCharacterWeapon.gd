extends Node2D
var playerInRange

# characterWeapon 

# node 
onready var sprite =$Sprite
onready var player =get_tree().get_root().find_node("player",true,false)

#data

var isAimPlayer =false

func _process(delta):
	

	pass


func _physics_process(delta):
	if playerInRange:
		aimPlayer()
	pass

	
func _ready():
	pass
	


func aimPlayer ():
    #瞄准玩家
	isAimPlayer=true	
	sprite.look_at(player.position)
	
	if player.position<get_parent().global_position:
		sprite.flip_v=true
	else:
		sprite.flip_v=false    
		pass
	








# ---------------------------------------------------------------Area2D 范围检测
func _on_nCharacterArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
	
	if body:
		if body.name=="player":
			bug.log("characterWeapon","玩家进入范围",false)
			playerInRange=true
		


func _on_nCharacterArea2d_body_shape_exited(body_id, body, body_shape, area_shape):
	if body:
		if body.name=="player":
			bug.log("characterWeapon","玩家离开",false)
			playerInRange=false
	
