TRY_CAST(TRY_CAST(NULLIF(LTRIM(RTRIM(LEFT(XO.ORDERCLASSID,4))),'') AS VARBINARY(8)) AS INT)				AS orderclasstypecode,		
TRY_CAST(NULLIF(LTRIM(RTRIM(XO.ORDERCLASSID)),'') AS NVARCHAR(20))										            AS orderclasstypename,	
		