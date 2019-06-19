#Create a CosmosDB account

#Login
#az login
#az account set -s "Microsoft Azure Internal Consumption"

#variables
SET RESOURCE_GROUP=CosmosDB%RANDOM%
SET LOCATION=northeurope
SET ACCOUNT_NAME=cosmos%RANDOM%

CALL az group create --name %RESOURCE_GROUP% --location %LOCATION%

CALL az cosmosdb create --resource-group %RESOURCE_GROUP% --name %ACCOUNT_NAME% --kind GlobalDocumentDB

CALL az cosmosdb list-keys --name %ACCOUNT_NAME% --resource-group %RESOURCE_GROUP% --query "primaryMasterKey" --output tsv>primaryKey
set /p key= < primaryKey 

echo ##vso[task.setvariable variable=CosmosDBRg]%RESOURCE_GROUP%
echo ##vso[task.setvariable variable=CosmosDBAccountName]%ACCOUNT_NAME%
echo ##vso[task.setvariable variable=CosmosDBEndpoint]https://%ACCOUNT_NAME%.documents.azure.com:443/
echo ##vso[task.setvariable variable=CosmosDBAuthKey]%key%