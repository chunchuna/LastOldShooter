extends KinematicBody2D
# characterAI

#node 
onready var sprite:Sprite =$Sprite
onready var shppe:CollisionShape2D =$shape
onready var Normalmovetimer:Timer =$tNormalMoveTimer
onready var moveTypeTimer:Timer=$tMoveTypeChangeTimer
onready var targetArea2d =$nCharacterArea2d/CollisionShape2D
onready var characterWeaponNode =$nCharacterWeapon


onready var player =get_tree().get_root().find_node("player",true,false)


# data 
var aiMoveSpeed =200
var statePoint
var stateAi=["move","attack"] 
var moveVec=Vector2()
# 移动
var allowMove=true  #移动开关	
var stopMovement=false # 禁止移动
var moveTimecut = 0.1 # 移动间隔
var randomMoveTimeCut=false# 随机移动间隔
# Huam 模式
var huamMoveType =true #模仿人类移动模式
var getInfastMoveType=false #进入快速移动模式

var attackDesireValue = 0  #进攻欲望



var playerinRange=false # 玩家在范围

var randomMoveTimeCutValueRange={     # 随机移动间隔范围
	"min":0,
	"max":3,
}

var hp =5000
var homePosition   # 初始位置



func _ready():
	homePosition=position
	iniAImove()
	

func _process(delta):
	playerinRange=characterWeaponNode.playerInRange 
	pass
	
	
func _physics_process(delta):
	
	
	move_and_slide(moveVec)
	
	# 状态机
	if stateAi.has("move"):
		allowMove=true
	else:
		allowMove=false    
	
	if stateAi.has("attck"):
		stateAIattack()

		pass	

	if stateAi.has("follow") and !stateAi.has("move"):
		stateAIfloowPlayer()


func _draw():
	#draw_line(position,player.position,Color(0, 0, 1),0.5,false)
	pass		
func iniAImove():
	# 初始化移动行为
	Normalmovetimer.wait_time=moveTimecut
	Normalmovetimer.start()
	

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


	#bug.log("character",moveType,false)
	
func stateAIattack():
	# 攻击
	pass  
	
func stateAIfloowPlayer():
	

	var followDistance = 230 # 跟随极限距离
	# 跟随玩家 自动寻路
 
	var dir = global_position.direction_to(player.global_position)*aiMoveSpeed
	if global_position.distance_to(player.global_position)>followDistance:
		dir =move_and_slide(dir)
	
	
	
	
	pass
	
func stateAIloot():
	# 拾取道具 
	pass
	
 
# ---------------------------------------------------------------指向状态    

func statePointDie():
   pass     

# ---------------------------------------------------------------- 移动计时器 

func _on_tNormalMoveTimer_timeout():
	# MoveCutTimer

	if allowMove and !stopMovement:
		# MoveType
		
		if !huamMoveType:
			if !randomMoveTimeCut:
				# def move type
				stateAImove()
			else:
				# random move type
				Normalmovetimer.wait_time=int(rand_range(randomMoveTimeCutValueRange.min,randomMoveTimeCutValueRange.max))


				
				stateAImove()


		if huamMoveType:
			# 模仿人类玩家移动模式
			if getInfastMoveType:
				Normalmovetimer.wait_time=0.1
				stateAImove()
			else:
				Normalmovetimer.wait_time=rand_range(0.7,0.8)
				stateAImove()	
		
	pass # Replace with function body.


func _on_tMoveTypeChangeTimer_timeout():
		
		# move type change timer
		moveTypeTimer.wait_time=rand_range(0.5,2.5)

		if getInfastMoveType:
			getInfastMoveType=false
		else:
			getInfastMoveType=true	
			
		pass # Replace with function body.
	

	
# ------------------------------------------------------------------Human Little Trick		

#node
func contactGetHurt(dmg):
	#受到伤害
	hp-=dmg
	#bug.log("character","currenthp"+str(hp),false)
	if hp<=0:
		hp=0

	





