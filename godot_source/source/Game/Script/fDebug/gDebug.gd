extends Node
 # debug 

# @ 输入log
# string(对象)
#string(文本)
# bool(是否错误模式")

func log(ins,text,error)-> void:
	

	var logFormat =str(ins+"("+str(text)+")")
	
	if error:
		print("error>>>>>>>>>>>>>>>\n"+logFormat)
	else:	
		print(logFormat)

	pass


