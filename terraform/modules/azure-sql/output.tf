output "server_fqdn" {
  value = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "database_name" {
  value = azurerm_mssql_database.sql_database.name
}