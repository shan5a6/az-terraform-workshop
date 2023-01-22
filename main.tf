resource "azurerm_resource_group" "javarg" {
  name     = "${var.application_name}-rg"
  location = var.location
}

resource "azurerm_network_security_group" "javansg" {
  name                = "${var.application_name}-nsg"
  location            = var.location
  resource_group_name = azurerm_resource_group.javarg.name
}

resource "azurerm_virtual_network" "javavnet" {
  name                = "${var.application_name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.javarg.name
  address_space       = var.java_cidr
}

resource "azurerm_subnet" "javasubnet" {
  name           = "${var.application_name}-sub"
  resource_group_name = azurerm_resource_group.javarg.name
  virtual_network_name = azurerm_virtual_network.javavnet.name
  address_prefixes = var.java_sub_cidr
}

resource "azurerm_public_ip" "javapubip" {
  name                = "${var.application_name}-pubip"
  resource_group_name = azurerm_resource_group.javarg.name
  location            = var.location
  allocation_method   = "Dynamic"

}

resource "azurerm_network_interface" "javanic" {
  name                = "${var.application_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.javarg.name
  depends_on	=	[azurerm_public_ip.javapubip]
  ip_configuration {
    name                          = "${var.application_name}-nic"
    subnet_id                     = azurerm_subnet.javasubnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.javapubip.id
  }
}
