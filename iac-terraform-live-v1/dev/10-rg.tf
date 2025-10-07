resource "azurerm_resource_group" "rg_data" {
  name     = "rg-data-${var.environment}"
  location = var.location
  tags = merge(
    var.tags,
    {
      Environment = "${var.environment}"
    }
  )
}
