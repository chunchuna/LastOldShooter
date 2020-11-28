extends Button
class_name  baseButton


func _on_bDoorButton_mouse_entered():
	GlobalVar.vMouseOnui=true
	


func _on_bDoorButton_mouse_exited():
	GlobalVar.vMouseOnui=false
	
	
