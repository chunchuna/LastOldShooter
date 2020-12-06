extends Node2D
#bullet.gd
onready var rigi2d =$RigidBody2D
onready var player =get_tree().get_root().find_node("player",true,false)
#onready var player_kin2d:KinematicBody2D =player.get_node("KinematicBody2D")

var flySpeed =1500
var Rebound=false  # 回弹
var flyDir =0 # 飞行方向
var dmg =0
var recoil =1
var father # 所属武器
var mouse_pos
var type ="self"

func _ready():
	#look_at(get_global_mouse_position())
	#rigi2d.global_rotation=flyDir
	rigi2d.linear_velocity=Vector2(cos(flyDir)*flySpeed,sin(flyDir)*flySpeed)

	# 子弹飞行
	#rigi2d.linear_velocity+=Vector2(cos(mouse_angle)*flySpeed,sin((mouse_angle)*flySpeed))
	mouse_pos=get_global_mouse_position() #初始化鼠标位置

	# 角色后坐力
	player.move_and_slide(Vector2(-cos(flyDir)*recoil,-sin(flyDir)*recoil))
	pass

func _init():

	pass

	
func _physics_process(delta):
	
	rigi2d.look_at(get_global_mouse_position())
	#rigi2d.position+=Vector2(mouse_pos-rigi2d.global_position)*0.5

	pass


	


func _on_Timer_timeout():
	
	queue_free()
	pass # Replace with function body.
