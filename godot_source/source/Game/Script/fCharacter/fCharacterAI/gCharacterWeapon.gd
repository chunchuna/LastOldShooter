extends Node2D
var playerInRange
var canShoot=false
# characterWeapon 

# node 
onready var sprite:Sprite =$sGunSprite
onready var fireSprite:Sprite =$sGunSprite/sFireLight
onready var player =get_tree().get_root().find_node("player",true,false)
onready var shootTimer =$tShootTimer
onready var animation =$AnimationPlayer

export(PackedScene)var bullet 
#data

var isAimPlayer =false

func _process(delta):
	

	pass


func _physics_process(delta):
	if playerInRange:
		aimPlayer()
	pass

	
func _ready():
	gunready()
	pass
	

# @ 武器初始化	
func gunready()->void:
	fireSprite.visible=false
	shootTimer.wait_time=int(rand_range(3,9)) # 初始化枪械计时器
	shootTimer.start()

	pass

# @ 开枪
func gunShoot()->void:
	# shoot
	animation.play("shootAnima") 
	var thisBullet = bullet.instance()
	
	# 子弹数据配置
	thisBullet.type="other"
	thisBullet.flySpeed = 1500
	thisBullet.flyDir=sprite.global_rotation
	thisBullet.dmg=230
	get_tree().get_root().add_child(thisBullet)
	thisBullet.global_position=fireSprite.global_position
	

	pass	


# @ 瞄准玩家	
func aimPlayer ():
	#瞄准玩家
	isAimPlayer=true	
	sprite.look_at(player.position)
	
	if player.position<get_parent().global_position:
		pass
	else:
		sprite.flip_v=false
		
		pass
	

# @ 玩家进入范围
func _on_nCharacterArea2d_body_shape_entered(body_id, body, body_shape, area_shape):
	
	if body:
		if body.name=="player":
			bug.log("characterWeapon","玩家进入范围",false)
			playerInRange=true
			canShoot=true
		

# @ 玩家离开范围
func _on_nCharacterArea2d_body_shape_exited(body_id, body, body_shape, area_shape):
	if body:
		if body.name=="player":
			bug.log("characterWeapon","玩家离开",false)
			isAimPlayer=false
			playerInRange=false
			canShoot=false
	
# @	开枪计时器		
func _on_tShootTimer_timeout ()->void:
	 
		if canShoot:
			shootTimer.wait_time=int(rand_range(1,2))
			gunShoot()

		return
	
