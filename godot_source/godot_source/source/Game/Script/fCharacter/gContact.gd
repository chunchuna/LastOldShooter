extends Node2D

# interaction.gd
# 互动物系统

onready var area2d =$Area2D
onready var name_lable=$Control/RichTextLabel

func _on_Area2D_body_shape_entered(body_id, body, body_shape, area_shape):
	if body!=null:
		if body.name=="player":
			name_lable.visible=true
			name_lable.bbcode_text=get_parent()._name
			pass
	pass # Replace with function body.


func _on_Area2D_body_shape_exited(body_id, body, body_shape, area_shape):	
	if body !=null:
		if body.name=="player":
			
			name_lable.visible=false
	pass
func _ready():
	

	name_lable.visible=false
	pass
