output "public_ip_ids" {
  value = { for name, pip in azurerm_public_ip.public_ip : name => pip.id }
}