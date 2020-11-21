extends Node2D

# characterWeapon 

# node 
onready var sprite =$nCharacterWeapon/Sprite



func _on_nCharacterArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
    # 范围检测
    if body.name=="player":
        bug.log("characterWeapon","玩家进入范围",false)
        pass
	
