# Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "main" {
  name                = "azdatabricks1-law"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Data Factory Diagnostic Settings
resource "azurerm_monitor_diagnostic_setting" "adf" {
  name                       = "adf-diagnostics"
  target_resource_id         = azurerm_data_factory.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "PipelineRuns"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  log {
    category = "ActivityRuns"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = false
    }
  }
}

# Databricks Diagnostic Settings
resource "azurerm_monitor_diagnostic_setting" "databricks" {
  name                       = "databricks-diagnostics"
  target_resource_id         = azurerm_databricks_workspace.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "clusters"
    enabled  = true
    retention_policy { enabled = false }
  }
  log {
    category = "jobs"
    enabled  = true
    retention_policy { enabled = false }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy { enabled = false }
  }
}

# Synapse Diagnostic Settings
resource "azurerm_monitor_diagnostic_setting" "synapse" {
  name                       = "synapse-diagnostics"
  target_resource_id         = azurerm_synapse_workspace.main.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "SqlRequests"
    enabled  = true
    retention_policy { enabled = false }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy { enabled = false }
  }
}

# Storage Account Diagnostic Settings
resource "azurerm_monitor_diagnostic_setting" "storage" {
  name                       = "storage-diagnostics"
  target_resource_id         = azurerm_storage_account.datalake.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.main.id

  log {
    category = "StorageRead"
    enabled  = true
    retention_policy { enabled = false }
  }
  log {
    category = "StorageWrite"
    enabled  = true
    retention_policy { enabled = false }
  }
  log {
    category = "StorageDelete"
    enabled  = true
    retention_policy { enabled = false }
  }
  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy { enabled = false }
  }
} 