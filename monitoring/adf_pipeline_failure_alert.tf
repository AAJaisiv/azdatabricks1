resource "azurerm_monitor_scheduled_query_rules_alert" "adf_pipeline_failure" {
  name                = "adf-pipeline-failure-alert"
  resource_group_name = azurerm_resource_group.main.name
  location            = azurerm_resource_group.main.location
  action {
    action_group_id = "<ACTION_GROUP_ID>" # Replace with your action group
  }
  data_source_id      = azurerm_log_analytics_workspace.main.id
  description         = "Alert on failed Data Factory pipeline runs"
  enabled             = true
  query               = <<-QUERY
    AzureDiagnostics
    | where ResourceType == "DATAFACTORIES"
    | where Status_s == "Failed"
  QUERY
  severity            = 2
  frequency           = 5
  time_window         = 5
  trigger {
    operator  = "GreaterThan"
    threshold = 0
  }
} 