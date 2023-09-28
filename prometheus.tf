resource "azurerm_monitor_workspace" "prometheus" {
  count = var.managed_prometheus_grafana_enabled ? 1 : 0
  name                = "prometheus-shared-aks"
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}
