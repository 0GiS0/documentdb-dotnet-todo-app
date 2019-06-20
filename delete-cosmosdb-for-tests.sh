printenv | grep CosmosDBAccountName
printenv | grep CosmosDBRg
az group delete --name env('CosmosDBRg') --yes --no-wait