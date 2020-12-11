extends Node2D

# debugPanle 
# debug UI


var isACtive=false
var canActive=true

# node 
onready var itemList =$Panel/ItemList


# @ 主函数
func _ready():
	self.GetDebugList()
	self.visible=false
pass


func _process(delta):
	active()

pass



# @ 激活
func active ():
	
	if Input.is_action_just_pressed("activeDebug") :
		if canActive:
			
			isACtive=!isACtive
			self.visible=isACtive
			bug.log("debugPanel","切换激活状态",false)
		
			
	
	
pass	



# @ 获取debug列表
func GetDebugList ():

		var debugGroup =get_tree().get_nodes_in_group("debugDrawGroup")
		for debugNode in debugGroup :
			var nodeName =debugNode.get_parent().name +"/"+str(debugNode.get_parent().get_index ( ) );
			
			itemList.add_item(nodeName,null,true)
			
		
pass




func _on_MouseCheck_mouse_entered():
	print("mouse enter")
	
	pass # Replace with function body.

	
	
