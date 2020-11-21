extends Node
 # debug 


func log(ins,text,error):
	

	var logFormat =str(ins+"("+str(text)+")")
	
	if error:
		print("error>>>>>>>>>>>>>>>\n"+logFormat)
	else:	
		print(logFormat)

	pass
