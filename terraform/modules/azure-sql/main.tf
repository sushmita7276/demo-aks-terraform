resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.sql_admin_username
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "sql_database" {
  name      = var.sql_database_name
  server_id = azurerm_mssql_server.sql_server.id
  sku_name  = var.sku_name
  max_size_gb = 2
}
resource "azurerm_mssql_firewall_rule" "aks_connection" {
  name             = "allow-aks-outbound-ip"
  server_id        = azurerm_mssql_server.sql_server.id
  start_ip_address = var.client_ip
  end_ip_address   = var.client_ip
}