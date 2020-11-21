extends KinematicBody2D
# characterAI

#node 
onready var sprite =$Sprite
onready var shppe =$shape
onready var timer =$Timer

# data 
var aiMoveSpeed =300
var statePoint
var stateAi



func _ready():
	pass

func _process(delta):
	pass
	
	
func _physics_process(delta):
	pass    



# 动作状态
func stateAImove():
	# 移动

	pass

func stateAIattack():
	# 攻击
	pass  
	
func stateAIfloowPlayer():
	# 跟随玩家
	pass
	
func stateAIloot():
	# 拾取道具
	pass
	
 
# 指向状态    

func statePointDie():
   pass     
