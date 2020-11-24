extends Navigation2D
# 寻路系统
# navigation 


# node 
onready var line_2d:Line2D =get_parent().get_node("Line2D")

func _ready():
	print(line_2d)

func Navi_findPath(target:Node2D,self_:Node2D) -> bool:

	return false
	pass

