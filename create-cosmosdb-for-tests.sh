#Variables
RESOURCE_GROUP=CosmosDB%RANDOM%
LOCATION=northeurope
ACCOUNT_NAME=cosmos%RANDOM%

#Create a resource group
az group create --name $RESOURCE_GROUP --location $LOCATION

#Create a CosmosDB account
az cosmosdb create --resource-group $RESOURCE_GROUP --name $ACCOUNT_NAME --kind GlobalDocumentDB

#Get the primary key
$primaryKey=$(az cosmosdb list-keys --name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query "primaryMasterKey" --output tsv)

#Get the endpoint
$endpoint=$(az cosmosdb show --name $ACCOUNT_NAME --resource-group $RESOURCE_GROUP --query "documentEndpoint" --output tsv)

echo "##vso[task.setvariable variable=CosmosDBRg]$RESOURCE_GROUP"
echo "##vso[task.setvariable variable=CosmosDBAccountName]$ACCOUNT_NAME"
echo "##vso[task.setvariable variable=CosmosDBEndpoint]$endpoint"
echo "##vso[task.setvariable variable=CosmosDBAuthKey]$key%"