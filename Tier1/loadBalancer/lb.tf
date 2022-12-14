resource "azurerm_public_ip" "public" {
  name                = "${var.name}-ip"
  location            = var.location
  resource_group_name = var.name
  allocation_method   = var.allocation_method
  sku                 = var.sku

  tags = var.tags
}

resource "azurerm_lb" "public" {
  name                = "${var.name}-public-lb"
  location            = var.location
  resource_group_name = var.name
  sku                 = var.sku

  frontend_ip_configuration {
    name                 = "${var.name}-public-ip"
    public_ip_address_id = azurerm_public_ip.public.id
  }

  tags = var.tags
}

resource "azurerm_lb_backend_address_pool" "public" {
  name            = "${var.name}-bknd-pool"
  loadbalancer_id = azurerm_lb.public.id
}

resource "azurerm_lb_outbound_rule" "public" {
  name                    = "OutboundRule"
  resource_group_name     = var.name
  loadbalancer_id         = azurerm_lb.public.id
  protocol                = "Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.public.id

  frontend_ip_configuration {
    name = "${module.centralus_loadbalancer_labels.id_with_suffix.lb}-public-ip"
  }
}

data "azurerm_virtual_network" "vm_vnet" {
  name                = "centralus-fxe-data-mgmt-prd-fxconnect-vnet"
  resource_group_name = "centralus-fxe-data-mgmt-prd-network-rg"
}

data "azurerm_network_interface" "backend_nic" {
  for_each = local.lb_backend_vm_nic
  name = each.key
  resource_group_name = var.name
}

resource "azurerm_network_interface_backend_address_pool_association" "backend_nic" {
  for_each = data.azurerm_network_interface.backend_nic
  network_interface_id    = data.azurerm_network_interface.backend_nic[each.key].id
  ip_configuration_name   = data.azurerm_network_interface.backend_nic[each.key].ip_configuration[0].name
  backend_address_pool_id = azurerm_lb_backend_address_pool.public.id
}