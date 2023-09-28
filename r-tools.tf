
module "certmanager" {
  source = "./tools/cert-manager"

  enable_cert_manager           = var.enable_cert_manager
  cert_manager_namespace        = var.cert_manager_namespace
  cert_manager_chart_repository = var.cert_manager_chart_repository
  cert_manager_chart_version    = var.cert_manager_chart_version
  cert_manager_settings         = var.cert_manager_settings
}

module "kured" {
  source = "./tools/kured"

  enable_kured           = var.enable_kured
  kured_settings         = var.kured_settings
  kured_chart_repository = var.kured_chart_repository
  kured_chart_version    = var.kured_chart_version
}

module "velero" {
  depends_on = [azurerm_kubernetes_cluster.aks]

  source = "./tools/velero"

  enable_velero = var.enable_velero

  client_name    = var.client_name
  stack          = var.stack
  environment    = var.environment
  location       = var.location
  location_short = var.location_short
  name_prefix    = var.name_prefix

  resource_group_name           = var.resource_group_name
  aks_nodes_resource_group_name = azurerm_kubernetes_cluster.aks.node_resource_group
  nodes_subnet_id               = var.nodes_subnet_id

  velero_namespace            = var.velero_namespace
  velero_chart_repository     = var.velero_chart_repository
  velero_chart_version        = var.velero_chart_version
  velero_values               = var.velero_values
  velero_storage_settings     = var.velero_storage_settings
  velero_identity_custom_name = var.velero_identity_custom_name

  velero_identity_tags = merge(local.default_tags, var.velero_identity_extra_tags)

}
