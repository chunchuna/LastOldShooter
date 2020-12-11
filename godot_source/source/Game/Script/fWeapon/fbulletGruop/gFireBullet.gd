extends Node2D
#Firebullet.gd
onready var rigi2d =$RigidBody2D
onready var animation=$AnimationPlayer
onready var light =$RigidBody2D/Sprite/Light2D

var flySpeed =900 
var Rebound=false  # 回弹
var flyDir =0 # 飞行方向
var recoil=0
var father 
var dmg =0
var type ="self"


func _ready():
	animation.play("FireBullet")
	look_at(get_global_mouse_position())
	rigi2d.global_rotation=flyDir
	rigi2d.linear_velocity=Vector2(cos(flyDir)*flySpeed,sin(flyDir)*flySpeed)
	
	pass
func _process(delta):
	
	# 玩家停止时 直接关闭FireBullet
	if Input.is_action_just_released("attack"):
		#print("realse")
		animation.playback_speed=15
		

	
	pass


func _on_Timer_timeout():
	
	queue_free()
	pass # Replace with function body.
