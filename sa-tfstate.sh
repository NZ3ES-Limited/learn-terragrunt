#!/bin/bash

# Variables
RESOURCE_GROUP_NAME="rg-terraform-state"
LOCATION="newzealandnorth"
STORAGE_ACCOUNT_DEV="nz3estfstate"
CONTAINER_NAME="tfstate"

echo "Creating resource group for Terraform state..."
az group create --name $RESOURCE_GROUP_NAME --location $LOCATION

echo "Creating storage account..."
az storage account create \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $STORAGE_ACCOUNT_DEV \
  --sku Standard_LRS \
  --encryption-services blob \
  --location $LOCATION

echo "Creating blob containers..."
az storage container create \
  --name $CONTAINER_NAME \
  --account-name $STORAGE_ACCOUNT_DEV

echo "Getting storage account keys..."
DEV_KEY=$(az storage account keys list \
  --resource-group $RESOURCE_GROUP_NAME \
  --account-name $STORAGE_ACCOUNT_DEV \
  --query '[0].value' -o tsv)

echo ""
echo "Backend setup complete!"
# echo ""
# echo "Set environment variables for DEV:"
# echo "export ARM_ACCESS_KEY=\"$DEV_KEY\""