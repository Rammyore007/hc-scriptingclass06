# This script creates all dependencies such as Azure Resource Group, App Service  and deploy web app and set deployment source as git hub repsitory

#!/bin/bash

# Create Azure Resources
RESOURCE_GROUP_NAME=CloudTrainer
APPSERVICE_PLAN_NAME=my-app-plan$RANDOM
WEBAPP_NAME=my-web-app$RANDOM
DEPLOYMENT_SOURCE=https://github.com/Azure-Samples/html-docs-hello-world
LOCATION=eastus

# Create an App Service plan
az appservice plan create --name $APPSERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME --location $LOCATION --SKU F1

# Create a Web app
az webapp create -- name $WEBAPP_NAME --plan $APPSERVICE_PLAN_NAME --resource-group $RESOURCE_GROUP_NAME

# Deploy an app from Github to Azure App Service
az webapp deployment source config -- repo-url $DEPLOYMENT_SOURCE --branch master --manual-integration -- name $WEBAPP_NAME --resource-group $RESOURCE_GROUP_NAME