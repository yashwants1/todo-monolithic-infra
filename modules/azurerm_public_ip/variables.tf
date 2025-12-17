variable "public_ips" {
  description = "List of public IPs to create"
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    env                 = string
  }))
}
