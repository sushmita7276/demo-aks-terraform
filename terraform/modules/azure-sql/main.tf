resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password

  minimum_tls_version           = "1.2"
  public_network_access_enabled = true
}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id

  sku_name    = var.sku_name
  max_size_gb = 2

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_mssql_firewall_rule" "client_ip" {
  count = var.client_ip == "" ? 0 : 1

  name             = "allow-development-client"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}