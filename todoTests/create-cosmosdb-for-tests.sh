#Create a CosmosDB account

#Login
#az login
#az account set -s "Microsoft Azure Internal Consumption"

#variables
$RESOURCE_GROUP="CosmosDBForTests"
$LOCATION="northeurope"
$ACCOUNT_NAME="cosmosdbtest001"

az group create --name $RESOURCE_GROUP --location $LOCATION

$result = az cosmosdb create --resource-group $RESOURCE_GROUP --name $ACCOUNT_NAME --kind GlobalDocumentDB

$documentEndpoint = $(az cosmosdb show --name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query "documentEndpoint")

echo "Document endpoint:"
echo $documentEndpoint
echo "##vso[task.setvariable variable=CosmosDBEndpoint]$documentEndpoint"
echo "##vso[task.setvariable variable=CosmosDBName]$ACCOUNT_NAME"
echo "##vso[task.setvariable variable=CosmosDBRG]$RESOURCE_GROUP"