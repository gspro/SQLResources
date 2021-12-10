(STUFF((Select '; '+ llr.name
				from  [r3AXTest].[dbo].DIRPARTYLOCATIONROLE 
				JOIN [r3AXTest].[dbo].LOGISTICSLOCATIONROLE LLR ON DIRPARTYLOCATIONROLE.LOCATIONROLE =LLR.RECID
				where DIRPARTYLOCATIONROLE.PARTYLOCATION = D.recid
				FOR XML PATH ('')
			)
			,1,2,''))															AS eds_purpose,
	
  
  --takes multiple row values and concatenates them into one
