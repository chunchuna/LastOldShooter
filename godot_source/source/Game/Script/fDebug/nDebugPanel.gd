extends Node2D

# debugPanle 
# debug UI


var isACtive=false
var canActive=true

var currentIndex 

# node 
onready var itemList:ItemList =$Panel/ItemList


# @ 主函数
func _ready():
	self.GetDebugList()
	self.visible=false
pass


func _process(delta):
	self.NodechooseCheck()
	active()

pass



# @ 激活
func active ():
	
	if Input.is_action_just_pressed("activeDebug") :
		if canActive:
			
			isACtive=!isACtive
			self.visible=isACtive
			bug.log("debugPanel","切换激活状态",false)	

# @ 获取debug列表
func GetDebugList ():

		var debugGroup =get_tree().get_nodes_in_group("debugDrawGroup")
		for debugNode in debugGroup :
			var nodeName =debugNode.get_parent().name +"/"+str(debugNode.get_parent().get_instance_id());
			
			itemList.add_item(nodeName,null,true)
			#itemList.set_item_text(itemList.get_item_count()-1,str(debugNode.get_index()))
			


# @选中列表
func _on_ItemList_item_selected(index):
	
	print(getString(index))
	currentIndex=index

	return	

# @获取String数据

func getString(index)->String:
	var getString = itemList.get_item_text(index)
	var lastIndexPos = getString.find_last("/")
	if lastIndexPos!=-1:
		var standString = getString.substr(lastIndexPos+1,-1)
		return standString
	return "null"



# @按下drawLine	
func _on_DrawLineButton_pressed():
	
	if currentIndex!=null:

		var node =self.getActualNode()
		print(node.name)
		node.isDrawLine=!node.isDrawLine


# @获取到需要操作的节点
func getActualNode():
	
	var getstring =getString(currentIndex)
	var debugGroup =get_tree().get_nodes_in_group("debugDrawGroup")
	for node in  debugGroup:
		if node.get_parent().get_instance_id() ==int(getstring):
			print("node name",node.name)
			print("node:",node.get_node("."))
			return node	
	pass # Replace with function body.
	
	return
	
# @节点选中高亮检测
func NodechooseCheck():
	if currentIndex!=null:
		var getstring =getString(currentIndex)
		var debugGroup =get_tree().get_nodes_in_group("debugDrawGroup")
		for node in debugGroup:
			if node.get_parent().get_instance_id()==int(getstring):
				node.debugDraw=true
				node.isDrawCbox=true
			else:
				node.isDrawCbox=false	

	return
