# Sample Terraform configuration for Azure Data Engineering Pipeline

provider "azurerm" {
  features {}
}

# Variables
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "azdatabricks1-rg"
}

variable "location" {
  description = "Azure region for resources"
  type        = string
  default     = "East US"
}

variable "storage_account_name" {
  description = "Name of the storage account (must be globally unique)"
  type        = string
  default     = "azdatabricks1storage"
}

variable "databricks_workspace_name" {
  description = "Name of the Databricks workspace"
  type        = string
  default     = "azdatabricks1-dbws"
}

variable "synapse_workspace_name" {
  description = "Name of the Synapse workspace"
  type        = string
  default     = "azdatabricks1-synapse"
}

variable "data_factory_name" {
  description = "Name of the Data Factory instance"
  type        = string
  default     = "azdatabricks1-adf"
}

# Resource Group
resource "azurerm_resource_group" "main" {
  name     = var.resource_group_name
  location = var.location
}

# Storage Account (for Data Lake)
resource "azurerm_storage_account" "datalake" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  is_hns_enabled           = true # Hierarchical namespace for Data Lake Gen2
}

# Azure Databricks Workspace
resource "azurerm_databricks_workspace" "main" {
  name                = var.databricks_workspace_name
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  sku                 = "standard"
}

# Azure Synapse Analytics Workspace
resource "azurerm_synapse_workspace" "main" {
  name                                 = var.synapse_workspace_name
  resource_group_name                  = azurerm_resource_group.main.name
  location                            = azurerm_resource_group.main.location
  storage_data_lake_gen2_filesystem_id = azurerm_storage_account.datalake.id
  sql_administrator_login              = "sqladminuser"
  sql_administrator_login_password     = "ChangeMe123!" # Change in production
}

# Azure Data Factory
resource "azurerm_data_factory" "main" {
  name                = var.data_factory_name
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
}

# Outputs
output "resource_group_name" {
  value = azurerm_resource_group.main.name
}
output "storage_account_name" {
  value = azurerm_storage_account.datalake.name
}
output "databricks_workspace_url" {
  value = azurerm_databricks_workspace.main.workspace_url
}
output "synapse_workspace_name" {
  value = azurerm_synapse_workspace.main.name
}
output "data_factory_name" {
  value = azurerm_data_factory.main.name
} 