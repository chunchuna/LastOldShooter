extends Node2D
# player data 

onready var _name ="test"
onready var bagTarget=false #背包触发器
# node 
onready var uNameLable


func _ready():
	yield(get_tree().create_timer(0.1),"timeout")
	uNameLable=get_parent().uNameLable
	uNameLable.bbcode_text="[center][color=yellow]"+_name+"[/color][/center]"


