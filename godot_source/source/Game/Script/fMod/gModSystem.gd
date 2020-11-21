extends Node2D
#modSystem.gd
var mods_path ="C:/los_mod"
var weapon_data =WeaponData # 武器数据 方便mod获取


var test_num =15
var mod_id =0

#mod 列表
onready var mod_list={
	
}
func _ready():
	modIni()
	load_mods()
	
	pass
	
	
	
func modIni():
	# mod 系统初始化
	var directory = Directory.new();
	var doFileExists = directory.dir_exists(mods_path)	
	if doFileExists:
		print("存在Mod文件夹")
		pass
	else:
		print("不存在mod文件夹")		
		directory.make_dir_recursive(mods_path)
		print("已经初始化mod文件夹")
		pass
	pass
		
func normal_load_mod():
	
	ProjectSettings.load_resource_pack(mods_path+"mod1.pck", true)
	var directory = Directory.new();
	var doFileExists = directory.file_exists("res://mod1.tscn")
	if doFileExists:
		
		var mod_ =load("res://mod1.tscn").instance()
		add_child(mod_)
		if mod_!=null:
			pass
	else:
		print("no mod")	  #没有找到mod

func load_mods():
	#载入mod
	
	var dir = Directory.new()
	if dir.open(mods_path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			if dir.current_is_dir():
				pass
			else:
				#print("Found file: " + file_name)
				mod_id+=1
				var mode_full =mods_path+"/"+file_name
				#print(mods_path+"/"+file_name)
				ProjectSettings.load_resource_pack(mode_full, true)
				var mod_ =load("res://mod.tscn").instance()
				add_child(mod_)
				mod_list[file_name]={"name":mod_.name_}
				print(mod_.get_groups()[0])
				#载入列表
			file_name = dir.get_next()
	else:
		print("An error occurred when trying to access the path.")


