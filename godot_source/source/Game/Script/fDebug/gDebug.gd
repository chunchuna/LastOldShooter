extends Node
 # debug 


func log(ins,text,error):
	
	if error:
		print("error>>>>>>>>>>>>>>>\n"+str(text))
	else:	
		print("log:"+str(ins+"("+str(text)+")"))

	pass
