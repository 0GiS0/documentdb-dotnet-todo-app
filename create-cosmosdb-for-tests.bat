#Create a CosmosDB account

#Login
#az login
#az account set -s "Microsoft Azure Internal Consumption"

#variables
SET RESOURCE_GROUP=CosmosDBForTests
SET LOCATION=northeurope
SET ACCOUNT_NAME=cosmosdbtest001

CALL az group create --name %RESOURCE_GROUP% --location %LOCATION%

CALL az cosmosdb create --resource-group %RESOURCE_GROUP% --name %ACCOUNT_NAME% --kind GlobalDocumentDB

echo "##vso[task.setvariable variable=CosmosDBEndpoint]https://%ACCOUNT_NAME%.documents.azure.com:443/"