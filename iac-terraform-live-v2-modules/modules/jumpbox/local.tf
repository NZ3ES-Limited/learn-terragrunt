locals {
  common_tags = merge(
    var.tags,
    {
      Environment = var.environment
    }
  )
}
