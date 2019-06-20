#!/bin/bash

echo $(CosmosDBAccountName)
echo $(CosmosDBRg)
az group delete --name $(CosmosDBRg) --yes --no-wait