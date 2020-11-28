extends Node2D
# debug draw

#node 
onready var line2d:Line2D=$Line2D
onready var cBox:ColorRect=$cBox
onready var playerNode =get_tree().get_root().find_node("player",true,false)

onready var selfNode =get_parent()


var debugDraw=true
export(bool) onready var isDrawCbox =true
export(bool) onready var isDrawLine= true
export(bool) var isPlayer=false

func _ready():
	cBox.visible=false
	pass

func _process(delta):
	
	if debugDraw:
		if isDrawCbox:
			drawCbox(debugDraw)

	pass
	

func drawLineToplayer()->void:
	# 绘制导航线条
	line2d.add_point(selfNode.global_position-playerNode.global_position)
	line2d.add_point(playerNode.global_position-selfNode.global_position)
	yield(get_tree().create_timer(0.5),"timeout")
	line2d.clear_points()
	pass	

func drawCbox(tage)->void:
	# 绘制 cBox
	cBox.visible=tage

	pass
func changeCboxSize(scal)->void:
	# 修改cBox绘制大小
	cBox.rect_scale=scal
	
	pass	

func _on_tLine2dTimer_timeout():
	if debugDraw:
		if isDrawLine and !isPlayer:
			drawLineToplayer()
		pass # Replace with function body.	
