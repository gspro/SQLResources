UPDATE [MSCRM_CONFIG].[dbo].[DeploymentProperties]
SET BitColumn = 1
WHERE ColumnName = 'ECAllowNonSSLEmail'


UPDATE [MSCRM_CONFIG].[dbo].[DeploymentProperties]
SET BitColumn = 1
WHERE ColumnName = 'AllowCredentialsEntryViaInsecureChannels'
