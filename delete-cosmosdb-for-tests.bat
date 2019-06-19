ECHO %CosmosDBAccountName%
ECHO %CosmosDBRg%
CALL az group delete --name "CosmosDBForTests" --yes --no-wait