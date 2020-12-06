extends KinematicBody2D
onready var spr =$Sprite
onready var animation =$AnimationPlayer
onready var uNameLable =$uPayer/Control/RichTextLabel  
var speed =200
var vec=Vector2()

func _ready():
	pass



func _physics_process(delta):
	
	if !ConsoleMain.console_active: get_input()  # 获取移动
	move_and_slide(vec)
	 #执行移动
	pass
	
func _process(delta):
	animationManneger()
	pass


# @玩家输入
func get_input():
	vec=Vector2.ZERO
	if Input.is_action_pressed("right"):
		vec.x+=1
		spr.flip_h=true
	if Input.is_action_pressed("left"):
		vec.x-=1
		spr.flip_h=false	
	if Input.is_action_pressed("up"):
		vec.y-=1	
	if Input.is_action_pressed("down"):
		vec.y+=1
		
	vec =vec.normalized()*speed	




# @ Player动画控制器	
func animationManneger ():
	# 动画控制
	if vec!=Vector2(0,0):
		animation.play("MoveBodyShake")
	else:
		animation.stop(true)	
		spr.rotation_degrees=0
	pass	
