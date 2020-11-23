extends Node
# 武器数据库 
# 更新时间:10/18


# 子弹总数
onready var allBulletNumber =9999  

#武器数据库 

onready var weaponString ={
	"gun":{
		"id:":0,
		"texture":"res://Game/Art/weaponTexture/gun.png",
		"bullet_tscn":"res://Game/fTSCN/bullet.tscn",
		"bulletMax":90,
		"bulletSpeed":1200,
		"damage":300,
		"shootCut":0.6,
		"realoading_system":false,
		"shake_":5.0,
		"recoil":1200,  # 后坐力
		"AutoFire":false, #自动步枪
	},
	
	"M4A1":{
		"id:":1,
		"texture":"res://Game/Art/weaponTexture/M4A1.png",
		"bullet_tscn":"res://Game/fTSCN/bullet.tscn",
		"bulletMax":150,
		"bulletSpeed":1500,
		"damage":120,
		"shootCut":0.05,
		"realoading_system":false,
		"shake_":6.0,
		"recoil":120,
		"AutoFire":true,
	
	},
	# 喷火枪
	"FireGun":{
		"id:":2,
		"texture":"res://Game/Art/weaponTexture/FireGun.png",
		"bullet_tscn":"res://Game/fTSCN/FireBullet.tscn",
		"bulletMax":900,
		"bulletSpeed":150,
		"damage":30,
		"shootCut":0.0001,
		"realoading_system":false,
		"shake_":6.0,
		"recoil":300,
		"AutoFire":true,
		
	}
	
}
