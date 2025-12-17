vms = {
  vm1 = {
    nic_name       = "nic-vm1"
    location       = "centralindia"
    rg_name        = "rg-dev"
    vnet_name      = "vnet-dev"
    subnet_name    = "frontend-subnet"
    pip_name       = "pip-vm1"
    vm_name        = "frontend-vm1"
    size           = "Standard_F2"
    admin_username = "azureuser"
    admin_password = "YourStrongP@ssword123!"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
  vm2 = {
    nic_name       = "nic-vm2"
    location       = "centralindia"
    rg_name        = "rg-dev"
    vnet_name      = "vnet-dev"
    subnet_name    = "backend-subnet"
    pip_name       = "pip-vm2"
    vm_name        = "backend-vm1"
    size           = "Standard_F2"
    admin_username = "azureuser"
    admin_password = "YourStrongP@ssword123!"
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
  }
}

rgs = {
  rg1 = {
    name       = "rg-dev"
    location   = "centralindia"
    managed_by = "Terraform"
    tags = {
      env = "dev"
    }
  }
}

networks = {
  vnet1 = {
    name                = "vnet-dev"
    location            = "centralindia"
    resource_group_name = "rg-dev"
    address_space       = ["10.0.0.0/16"]
    tags = {
      environment = "dev"
    }
    subnets = [
      {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    ]
  }
}

public_ips = {
  app1 = {
    name                = "pip-vm1"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    allocation_method   = "Static"
    env                 = "frontend"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
  app2 = {
    name                = "pip-vm2"
    resource_group_name = "rg-dev"
    location            = "centralindia"
    allocation_method   = "Static"
    env                 = "backend"
    tags = {
      app = "frontend"
      env = "prod"
    }
  }
}


# key_vaults = {
#   kv1 = {
#     kv_name  = "kv-dev"
#     location = "centralindia"
#     rg_name  = "rg-dev"
#   }
# }
