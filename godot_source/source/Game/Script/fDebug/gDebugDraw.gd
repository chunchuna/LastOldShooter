extends Node2D
# debug draw

#node 
onready var line2d:Line2D=$Line2D
onready var cBox:ColorRect=$cBox
onready var playerNode =get_tree().get_root().find_node("player",true,false)

onready var selfNode =get_parent()


var debugDraw=false
export(bool) onready var isDrawCbox 
export(bool) onready var isDrawLine
export(bool) var isPlayer=false

func _ready():
	cBox.visible=false
	pass

func _process(delta):
	
	if debugDraw:
		# draw
		if isDrawCbox:
			drawCbox(debugDraw)
		else:
			drawCbox(false)	
	else:
		drawCbox(false)			

	pass
	
	

# @ 绘制导航线条
func drawLineToplayer()->void:

	#line2d.add_point(selfNode.global_position-playerNode.global_position)
	#line2d.add_point(playerNode.global_position-selfNode.global_position)
	line2d.add_point(Vector2(0,0))
	line2d.add_point(playerNode.global_position-selfNode.global_position)
	
	yield(get_tree().create_timer(0.5),"timeout")
	
	line2d.clear_points()
	pass	

# @ 绘制 cBox
func drawCbox(tage)->void:

	cBox.visible=tage

	pass

# @ 改变cbox大小	
func changeCboxSize(scal)->void:
	# 修改cBox绘制大小
	cBox.rect_scale=scal
	
	pass	

# @ 导航条绘制计时器	
func _on_tLine2dTimer_timeout():
	if debugDraw:
		if isDrawLine and !isPlayer:
			drawLineToplayer()
		pass # Replace with function body.	


