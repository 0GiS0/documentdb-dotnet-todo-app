printenv | grep CosmosDBAccountName
printenv | grep CosmosDBRg
az group delete --name ${CosmosDBRg} --yes --no-wait