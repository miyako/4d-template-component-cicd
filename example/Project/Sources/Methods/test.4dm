//%attributes = {}
If (Get application info:C1599.headless)
	
	$stdErr:="Unit tests passed"
	
	LOG EVENT:C667(Into system standard outputs:K38:9; $stdErr; Error message:K38:3)
	
	If (Application type:C494#6)
		QUIT 4D:C291
	End if 
	
Else 
	
End if 