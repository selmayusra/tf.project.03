# create a public ip
resource "azurerm_public_ip" "frontend" {
  name                = "lb_tf_pip"
  location            = azurerm_resource_group.slmysrRG.location
  resource_group_name = azurerm_resource_group.slmysrRG.name
  allocation_method   = "Static"
}

# create a load balancer
resource "azurerm_lb" "frontend" {
  name                = "tf-lb"
  location            = azurerm_resource_group.slmysrRG.location
  resource_group_name = azurerm_resource_group.slmysrRG.name
  frontend_ip_configuration {
    name                          = "default"
    public_ip_address_id          = azurerm_public_ip.frontend.id
    private_ip_address_allocation = "dynamic"
  }
}

resource "azurerm_lb_backend_address_pool" "lb1_bap" {
  name            = "lb1_bap"
  loadbalancer_id = azurerm_lb.frontend.id
}

resource "azurerm_network_interface_backend_address_pool_association" "lb1_bap_association" {
  count                   = var.arm_vm_count
  network_interface_id    = "${element(azurerm_network_interface.nic.*.id, count.index)}"
  ip_configuration_name   = "${element(azurerm_network_interface.nic.*.ip_configuration.0.name, count.index)}"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb1_bap.id
}

# create a load balancer probe PORT 80
resource "azurerm_lb_probe" "lb1_probe_80" {
  name            = "lb1_probe_80"
  loadbalancer_id = azurerm_lb.frontend.id
  protocol        = "Tcp"
  request_path    = "/"
  port            = 80
}

# create a load balancer rule PORT 80
resource "azurerm_lb_rule" "lb1_rule_80" {
  name                           = "lb1_rule_80"
  loadbalancer_id                = azurerm_lb.frontend.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.lb1_bap.id}"]
  probe_id                       = azurerm_lb_probe.lb1_probe_80.id
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = "default"
}

# Create a load balancer probe PORT 443
resource "azurerm_lb_probe" "lb1_probe_443" {
  name            = "lb1_probe_443"
  loadbalancer_id = azurerm_lb.frontend.id
  protocol        = "Tcp"
  request_path    = "/"
  port            = 443
}

# create a load balancer backend address pool
resource "azurerm_lb_rule" "lb1_rule_443" {
  name                           = "lb1_rule_443"
  loadbalancer_id                = azurerm_lb.frontend.id
  backend_address_pool_ids       = ["${azurerm_lb_backend_address_pool.lb1_bap.id}"]
  probe_id                       = azurerm_lb_probe.lb1_probe_443.id
  protocol                       = "Tcp"
  frontend_port                  = 443
  backend_port                   = 443
  frontend_ip_configuration_name = "default"
}