extends KinematicBody2D
# characterAI

#node 
onready var sprite:Sprite =$Sprite
onready var shppe:CollisionShape2D =$shape
onready var movetimer:Timer =$tMoveTimer

# data 
var aiMoveSpeed =10
var statePoint
var stateAi = "move"
var moveVec=Vector2()

var allowMove=true  #是否允许移动
var moveTimecut = 0.5 # 移动间隔

var hp =500

func _ready():
	iniAImove()
	

func _process(delta):
	pass
	
	
func _physics_process(delta):
	
	
	move_and_slide(moveVec)
	
	# 状态机
	if stateAi=="move":
		allowMove=true
	else:
		allowMove=false    


func iniAImove():
	# 初始化移动行为
	movetimer.wait_time=moveTimecut
	movetimer.start()
	

# ------------------------------------------------------------------动作状态
func stateAImove():
	# 移动
	moveVec=Vector2.ZERO
	randomize()
	var random =int(rand_range(-1,4))
	var moveTypeBase=["up","down","left","right"]
	var moveType = moveTypeBase[random]
	# movement 
	if moveType=="up":
		moveVec.y-=1
	if moveType=="down":
		moveVec.y+=1 
	if moveType=="left":
		moveVec.x-=1
	if moveType=="right":
		moveVec.x+=1     
		 
	moveVec=moveVec.normalized()*aiMoveSpeed     




	bug.log("character",moveType,false)
	
	

func stateAIattack():
	# 攻击
	pass  
	
func stateAIfloowPlayer():
	# 跟随玩家
	pass
	
func stateAIloot():
	# 拾取道具
	pass
	
 
# ---------------------------------------------------------------指向状态    

func statePointDie():
   pass     

# ----------------------------------------------------------------计时器 
func _on_Timer_timeout():
	if allowMove:
		stateAImove()
	
