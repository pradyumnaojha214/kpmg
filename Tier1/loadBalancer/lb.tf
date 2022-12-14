resource "azurerm_public_ip" "public" {
  name                = "${var.name}-ip"
  location            = var.location
  resource_group_name = var.name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_lb" "public" {
  name                = "${var.name}-public-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {
    name                 = "${var.name}-public-ip"
    public_ip_address_id = azurerm_public_ip.public.id
  }
}

resource "azurerm_lb_backend_address_pool" "public" {
  name            = "${var.name}-bknd-pool"
  loadbalancer_id = azurerm_lb.public.id
}

resource "azurerm_lb_outbound_rule" "public" {
  name                    = "${var.name}-OutboundRule"
  resource_group_name     = var.name
  loadbalancer_id         = azurerm_lb.public.id
  protocol                = var.protocol//"Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.public.id

  frontend_ip_configuration {
    name = "${var.name}-public-ip"
  }
}


