extends Camera2D
var get_player =true
# 屏幕震动
var shake_amount =3.0
var toShake =false

onready var player_kin2d =get_parent().get_node("YSort/player")

func cameraMoveSystem():
	if get_player:
		global_position=lerp(global_position,player_kin2d.global_position,0.05)


func _process(delta):
	cameraMoveSystem()
	ScreenShake()

func look_other(other,keep_time,camera_speed):   #视角的对象  持续时间  相机速度
	# 视角移动
	get_player=false
	global_position=lerp(global_position,other.global_position,camera_speed)
	yield( get_tree().create_timer(keep_time),"timeout")
	get_player=true

func ScreenShake():
	
	# 屏幕震动
	if toShake:
		set_offset(Vector2( \
			rand_range(-1.0, 1.0) * shake_amount, \
			rand_range(-1.0, 1.0) * shake_amount \
		))
		# 关闭屏幕震动
		yield(get_tree().create_timer(0.5),"timeout")
		toShake=false
	
	pass
