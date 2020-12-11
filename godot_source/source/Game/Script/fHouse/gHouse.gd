extends Node2D
# house.hd
# 这里存放 House 的内容


# door

export(bool) var doorLock=true
onready var doorStaticshape =$nDoor/sDoorstatic/shape
onready var doorAreaShape =$aHouseArea2d/shape
onready var doorButton =$UI/ui/bDoorButton
onready var doorSprite =$nDoor/sDoorSprite
onready var doorState="close"  # door state



# House 
onready var HouseMask =$cHouseMaskNode2d
onready var HouseAreaShape =$cHouseMaskNode2d/cHouseMask
export (bool) var is_inHouse =false
# Animayion 
onready var animation =$AnimationPlayer


func _ready():
	doorButton.visible=false
	HouseAreaShape.visible=true
	print("in notpad ++")
	pass
   


func _process(delta):
	doorStateController()
	pass    

	
	
	

# @进入房门范围检测
func _on_aDoorArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
	if body:
		if body.name=="player":
			doorButton.visible=true
			
	else:
		return        
	pass
# @离开房门	范围检测
func _on_aDoorArea2d_body_shape_exited(body_id, body, body_shape, area_shape):
			
	if body:
		if body.name=="player":
			doorButton.visible=false
	
	pass # Replace with function body.
			
# @ 开门按钮按下
func _on_bDoorButton_pressed():
	# door button
	
	if doorState=="close":
		if doorLock:
			if mCheckDoorpromission():  # check whether have key in bag ## bag is temp main bag in autoload gd script
				doorState="open"
			else:
				bug.log("door","door is lock",false)


		if !doorLock:
			bug.log("door","door is open",false)
			doorState="open"    
	else:
		# door is open 
		doorState="close"
		print("you close the door")
	pass
# @ 房门状态控制管理
func doorStateController():
	
	# Door state manager
	if doorState=="open":
		doorSprite.visible=false
		doorStaticshape.disabled=true
		doorButton.text="close"
	
	if doorState=="close":
		doorSprite.visible=true 
		doorStaticshape.disabled=false   
		doorButton.text="open"

	pass
	
# @ 房门开放权限管理
func mCheckDoorpromission ()->bool:
	# 检查门锁开放权限
	if  GlobalVar.mainBag.has("key"):
		return true
	else:
		return false	
	
	
	pass
# @进入房间范围检测
func _on_aHouseArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
	# player in House 
	if body:
		if body.name=="player":
			bug.log("sys","player in house",false)
			is_inHouse=true
			animation.play("HouseMask")

	
	
	
	pass
# @离开房间范围检测
func _on_aHouseArea2d_body_shape_exited(body_id, body, body_shape, area_shape):
	# player out Hose 
	if body:
		if body.name=="player":
			animation.play_backwards("HouseMask")
			is_inHouse=false
	pass # Replace with function body.

	
	
	