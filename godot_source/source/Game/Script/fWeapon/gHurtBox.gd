extends Node2D
#bedamge_node.gd

var bullet_dmg 
var bullet_type 
var weapon_name
var dmg_text =preload("res://Game/fTSCN/dmg_text.tscn")
var targe=false
onready var player =get_tree().get_root().find_node("player",true,false)
func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	
	if body!=null:
		if body.get_parent().is_in_group("bullet"):
			
			
			# 获取数据
			bullet_dmg =body.get_parent().dmg
			if body.get_parent().type =="self":
				weapon_name=body.get_parent().father.weapon_name
			
			# 显示伤害UI
			var dmg_ =dmg_text.instance()
			get_tree().get_root().add_child(dmg_)
			dmg_.global_position=self.global_position
			dmg_.set_dmg(bullet_dmg)
			body.get_parent().queue_free()
				
			# 执行伤害
			if get_parent().has_method("contactGetHurt"):
				get_parent().contactGetHurt(bullet_dmg)




			pass
	pass


