ECHO %CosmosDBAccountName%
ECHO %CosmosDBRg%
CALL az group delete --name %CosmosDBRg% --yes --no-wait