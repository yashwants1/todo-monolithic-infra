module "rg" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "networks" {
  source   = "../../modules/azurerm_networking"
  networks = var.networks
  depends_on = [ module.rg ]
}

module "pip" {
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
  depends_on = [ module.rg ]
}

module "sql_server" {
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp1"
  rg_name         = "rg-dev"
  location        = "centralindia"
  admin_username  = "devopsadmin"
  admin_password  = "$tr0n9P@9191"
  tags            = {}
  depends_on = [ module.rg ]
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqldb-dev-todoapp"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = {}
}

module "vm" {
  depends_on = [ module.rg, module.pip, module.networks ]
  source = "../../modules/azurerm_compute"
  vms = var.vms
   
}

# module "kv" {
#   source = "../../modules/azurerm_key_vault"
#   key_vaults = var.key_vaults
# }