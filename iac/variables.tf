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