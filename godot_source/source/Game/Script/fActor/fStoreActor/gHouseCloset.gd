extends Node2D
class_name StoreActor

# storeActore 基类
#node 
onready var namelable:RichTextLabel=$nUI/nameLable
onready var uiNode =$nUI

export(String) var node_name ="nodename"
export(Array) var itemStore 
var node_type ="store"

func _ready():

	uiNode.visible=false
	yield(get_tree().create_timer(0.5),"timeout")
	namelable.bbcode_text="[center]"+node_name




func _on_area_body_entered(body):
	if body:
		if body.name=="player":
			uiNode.visible=true
		


func _on_area_body_exited(body):
	if body:
		if body.name=="player":
			uiNode.visible=false
			



func _on_seachButton_pressed():

	# 触发 seach
	if itemStore.empty():
		bug.log("storeActore","空",false)
		pass
	else:
		print(itemStore)
		dataSeachItem()
		pass
	
func dataSeachItem()->void:
	itemStore.clear()
	# 放进背包
	pass
