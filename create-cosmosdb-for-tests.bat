#Variables
SET RESOURCE_GROUP=CosmosDB%RANDOM%
SET LOCATION=northeurope
SET ACCOUNT_NAME=cosmos%RANDOM%

#Create a resource group
CALL az group create --name %RESOURCE_GROUP% --location %LOCATION%

#Create a CosmosDB account
CALL az cosmosdb create --resource-group %RESOURCE_GROUP% --name %ACCOUNT_NAME% --kind GlobalDocumentDB

#Get the primary key
CALL az cosmosdb list-keys --name %ACCOUNT_NAME% --resource-group %RESOURCE_GROUP% --query "primaryMasterKey" --output tsv>primaryKey
set /p key= < primaryKey

#Get the endpoint
CALL az cosmosdb show --name %ACCOUNT_NAME% --resource-group %RESOURCE_GROUP% --query "documentEndpoint" --output tsv>documentEndpoint
set /p endpoint= < documentEndpoint

echo ##vso[task.setvariable variable=CosmosDBRg]%RESOURCE_GROUP%
echo ##vso[task.setvariable variable=CosmosDBAccountName]%ACCOUNT_NAME%
echo ##vso[task.setvariable variable=CosmosDBEndpoint]%endpoint%
echo ##vso[task.setvariable variable=CosmosDBAuthKey;issecret=true]%key%