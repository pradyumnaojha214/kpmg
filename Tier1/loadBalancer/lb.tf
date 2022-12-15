resource "azurerm_public_ip" "public" {   ## block for creating public ip for lb
  name                = "${var.name}-ip"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.allocation_method
  sku                 = var.sku
}

resource "azurerm_lb" "public-lb" {   ## block for creating lb
  name                = "${var.name}-public-lb"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  frontend_ip_configuration {   ## Front end ip configuration
    name                 = "${var.name}-public-ip"
    public_ip_address_id = azurerm_public_ip.public.id
  }
}

resource "azurerm_lb_backend_address_pool" "public-pool" {  ## block for creating backend address pool 
  name            = "${var.name}-bknd-pool"
  loadbalancer_id = azurerm_lb.public-lb.id
  depends_on = [
    azurerm_lb.public-lb
  ]
}



resource "azurerm_lb_backend_address_pool_address" "public-pool-addr" { ## block for config lb and vm as backend pool through nic of vm
  name                    = "${var.name}-bknd-pool-address"
  backend_address_pool_id = azurerm_lb_backend_address_pool.public-pool.id
  virtual_network_id      = var.virtual_network_id 
  ip_address              = var.ip_address 
}

resource "azurerm_lb_probe" "lb-probe" {    ## block for creating health probe for backend pool
  loadbalancer_id = azurerm_lb.public-lb.id
  name            = "test-health"
  port            = 80
}


resource "azurerm_lb_outbound_rule" "public-ob-rule" { ## block for creating outbound rule but not required right now
  name                    = "${var.name}-OutboundRule"
  loadbalancer_id         = azurerm_lb.public-lb.id
  protocol                = var.protocol//"Tcp"
  backend_address_pool_id = azurerm_lb_backend_address_pool.public-pool.id

  frontend_ip_configuration {
    name = "${var.name}-public-ip"
  }
}


