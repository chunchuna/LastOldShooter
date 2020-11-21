extends KinematicBody2D
# characterAI

#node 
onready var sprite:Sprite =$Sprite
onready var shppe:CollisionShape2D =$shape
onready var movetimer:Timer =$tMoveTimer
onready var targetArea2d =$nCharacterArea2d/CollisionShape2D
onready var characterWeaponNode =$nCharacterWeapon

# data 
var aiMoveSpeed =80
var statePoint
var stateAi = "move"
var moveVec=Vector2()

var allowMove=true  #是否允许移动
var moveTimecut = 0.5 # 移动间隔
var randomMoveTimeCut=false # 随机移动间隔

var randomMoveTimeCutValueRange={     # 随机移动间隔范围
	"min":0,
	"max":0,
}

var hp =5000
var homePosition   # 初始位置
func _ready():
	homePosition=position
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
	
	if stateAi =="attck":
		stateAIattack()

		pass	

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
	

#node
func contactGetHurt(dmg):
	#收到伤害
	hp-=dmg
	bug.log("character","currenthp"+str(hp),false)
	if hp<=0:
		hp=0

	
