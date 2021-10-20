# =============== Resource group ===============
# The Production resource group at azure cloud
resource "azurerm_resource_group" "production" {
  name     = "ansible_production"
  location = "switzerlandnorth"
}