extends Node2D
#weaponNode.gd
onready var weapon_spr :Sprite =$gun # 武器贴图
onready var gunFirePos :Position2D =$gun/Position2D # 开火位置
# 开火初始位置
onready var fire_ex_pos =gunFirePos.position 
# 开火位置偏移
onready var fire_pos_offset=Vector2(gunFirePos.position.x,gunFirePos.position.y+50) 
# 开火延时计时器
onready var fire_timer= $fire_timer
# 开火火光_光源
onready var fire_light =$fire_light
#开火火光_贴图
onready var fire_light_spr =$gun/fire_light
#开火贴图_偏移
onready var fire_light_spr_ex_pos =fire_light_spr.position
onready var fire_light_spr_offset =Vector2(fire_light_spr.position.x,fire_light_spr.position.y+30)
# 动画系统
onready var animation =$AnimationPlayer
# 相机
onready var camera =get_tree().get_root().find_node("SenceCamera",true,false)


# 是否拥有武器
var has_weapon=true  
export(String)var weapon_name="gun"
var weapon_level=99

var weaponType ="Gun"
var damage =80 
var bulletSpeed =1200
var shootCutSpeed =0.2
var can_fire=true  # 开火闸门
var recoil =0  # 后坐力
var autoFire =true  # 自动步枪

#Gun 
var bullet_max=30 
var bullet_current =30
var bullet_reload_system=false  # 换弹系统
var canShoot=true
export(PackedScene) var bullet_tscn
#onready var bullet = load(bullet_tscn_path)


#data
var data =WeaponData
onready var dataString =data.weaponString

var bullet_clip =0 # 子弹夹

func _ready():
	fire_light_spr.visible=false
	fire_light.visible=false
	LoadWeaponData()
	pass

	
func _physics_process(delta):
	
		if has_weapon:
			get_input()
		else:
			weapon_spr.texture=null		


# @ 读取武器数据	
func LoadWeaponData():
	# 读取数据
	# 导入武器配置
	# 读取数据库
	
	if !dataString.has(weapon_name):
		print("can not find data")
		return
	else:
		# 读取武器数据
		self.loadWeaponData_data()
	pass	





# @读取武器数据
func loadWeaponData_data():
		# type
	
		var get_wea_texture:StreamTexture=load(dataString[weapon_name].texture)	
		# 贴图
		weapon_spr.texture=get_wea_texture
		# 伤害
		damage=dataString[weapon_name].damage
		# 子弹射速
		bulletSpeed=dataString[weapon_name].bulletSpeed
		shootCutSpeed=dataString[weapon_name].shootCut
		fire_timer.wait_time=shootCutSpeed
		# 子弹数上限
		bullet_max=dataString[weapon_name].bulletMax
		bullet_current=bullet_max
		#后坐力
		recoil=dataString[weapon_name].recoil
		# 子弹
		if dataString[weapon_name].bullet_tscn!=null:
			bullet_tscn=load(dataString[weapon_name].bullet_tscn) # 子弹地址
		# 自动开火	
		autoFire=dataString[weapon_name].AutoFire
		
	#print("已经读取数据")		
		pass

	

# @ 玩家输入检测
func get_input():
	
		if !ConsoleMain.console_active: #检查控制台是否打开
			# 武器朝向
			var mousePos =get_global_mouse_position()
			look_at(mousePos)
			if mousePos.x<global_position.x:
				weapon_spr.flip_v=true
				
				
				# 偏移处理
				gunFirePos.position=fire_pos_offset
				fire_light_spr.position=fire_light_spr_offset
			else:
				weapon_spr.flip_v=false
				
				
				# 偏移处理
				gunFirePos.position=fire_ex_pos
			
			
				fire_light_spr.position=fire_light_spr_ex_pos
			
			
			
			#攻击
			if Input.is_action_pressed("attack") and GlobalVar.vMouseOnui==false:
				attack()	
			#换子弹
			
			if Input.is_action_just_pressed("reloading_bullet"):
				readlingBullet()	



# @ 武器攻击	
func attack ():
	# 攻击
	# Gun 
	if weaponType =="Gun":
		if bullet_current>0 and canShoot and can_fire:
			can_fire=false
			fire_timer.start()
			
			if autoFire:  # 检查是否时自动开火
				animation.play("Auto_fire")
			else:
				animation.play("Single_fire")

			# ScreenShake
			camera.toShake=true
			# 释放武器数据  
			self.dataRealess()
			
	
	elif weaponType =="close":
		# 近程武器
		#print("close")
		pass		
		
	
	pass
	
# @ 数据释放
func dataRealess():
	# 数据释放
	var thisBullet =bullet_tscn.instance()  # 生成子弹
	thisBullet.flyDir=global_rotation
	thisBullet.flySpeed=bulletSpeed
	thisBullet.recoil=recoil
	thisBullet.dmg=damage
	thisBullet.father =self  
	get_tree().get_root().add_child(thisBullet)
	thisBullet.global_position=gunFirePos.global_position
	bullet_current-=1
	
	#print("枪支剩余弹药:",bullet_current)
	pass	



# @ 换子弹	
func readlingBullet():
	#换子弹
	if bullet_current<=0 and WeaponData.allBulletNumber-bullet_max>0:
		WeaponData.allBulletNumber-=bullet_max
		bullet_current=bullet_max
	else:
		print("弹药库子弹不足！！")	
		
# @ 开火计时器	
func _on_fire_timer_timeout():
	can_fire=true
	pass # Replace with function body.
