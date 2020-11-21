extends Node2D
# house.hd
# 这里存放 House 的内容


# About door

export(bool) var doorLock=true
onready var doorStaticshape =$nDoor/sDoorstatic/shape
onready var doorAreaShape =$aHouseArea2d/CollisionShape2D
onready var doorButton =$UI/ui/bDoorButton
onready var doorSprite =$nDoor/sDoorSprite
onready var doorState="close"  # 门的状态

# House 
onready var HouseMask =$cHouseMask
onready var HouseAreaShape =$aHouseArea2d/shape

# Animayion 
onready var animation =$AnimationPlayer


func _ready():
	doorButton.visible=false
	pass



func _process(delta):
	doorStateController()
	pass    

func _on_aDoorArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
	if body:
		if body.name=="player":
			doorButton.visible=true
			
	else:
		return        
	
	
func _on_aDoorArea2d_body_shape_exited(body_id, body, body_shape, area_shape):
			
	if body:
		if body.name=="player":
			doorButton.visible=false
	
	pass # Replace with function body.
			






func _on_bDoorButton_pressed():
	# door button
	
	if doorState=="close":
		if doorLock:
			print("lock")

		if !doorLock:
			print("door is open")
			doorState="open"    
	else:
		# door is open 
		doorState="close"
		print("you close the door")


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


	


func _on_bDoorButton_mouse_entered():
	GlobalVar.vMouseOnui=true
	
	pass # Replace with function body.


func _on_bDoorButton_mouse_exited():
	GlobalVar.vMouseOnui=false
	pass # Replace with function body.




func _on_aHouseArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
	# player in House 
	if body:
		if body.name=="player":
			animation.play("HouseMask")

	


func _on_aHouseArea2d_body_shape_exited(body_id, body, body_shape, area_shape):
	# player out Hose 
	if body:
		if body.name=="player":
			animation.play_backwards("HouseMask")
	pass # Replace with function body.
