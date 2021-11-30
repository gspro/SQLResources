/*
--======================================================================================================
--HOW TO USE THE ENUM2STR FUNCTION IN TABLE
--======================================================================================================
--Step 1: Locate the correct enumeration.
--------------------------------------------------------------------------------------------------------
SELECT *
FROM [r3AXTest_Model].[dbo].[ModelElement]
WHERE ([NAME] LIKE '%Status%')
AND ([ELEMENTTYPE] = 40)
ORDER BY [NAME]




--------------------------------------------------------------------------------------------------------
--Step 2: Create a view that pulls only the relevent data using something like this...
--------------------------------------------------------------------------------------------------------



SELECT DISTINCT
TRY_CAST(L.[lookupvalue] AS INT) AS valueid,
ISNULL(NULLIF(TRY_CAST([dbo].[ENUM2STR](L.[lookuptype], L.[lookupvalue]) AS NVARCHAR(100)),''),'-empty-') AS valuename,
TRY_CAST(UPPER(L.[lookuptype]) AS NVARCHAR(100)) AS valuetype
FROM (
SELECT DISTINCT
'SalesStatus' AS lookuptype, --Change this to the ENUM value type (step 1)
[SalesStatus] AS lookupvalue --Change this to the field containing the value
FROM [r3AXTest].[dbo].[SALESTABLE] --Change this to the table containing the value


) AS L



--------------------------------------------------------------------------------------------------------
--Step 3: Insert that data to the Enumeration table.
--------------------------------------------------------------------------------------------------------
INSERT INTO [dbo].[ax_enumerated_values]([valueid],[valuename],[valuetype])
SELECT *
FROM <script form step 2>



--------------------------------------------------------------------------------------------------------
--Step 4: Join to the Enumeration table your custom select query.
--------------------------------------------------------------------------------------------------------
SELECT *
FROM [$(AX_DATABASE)].[dbo].[XAP_EQUIPMENTUSAGETABLE] AS U LEFT OUTER JOIN
(
SELECT [valueid],[valueame]
FROM [dbo].[ax_enumerated_values]
WHERE ([valuetype] = 'XAP_PeriodType')
) AS PT ON PT.[valueid] = U.[ESTIMATEDPERIODTYPE]



--======================================================================================================
--FIND REF CODES
--======================================================================================================
SELECT DISTINCT
[eds_datatype]
FROM [D365_Test].[dbo].[ax_d365_category_lines]



*/
