module "vpc" {
  source  = "cloudposse/vpc/aws"
  version = "2.2.0"

  ipv4_primary_cidr_block = var.ipv4_primary_cidr_block
  tags                    = local.tags

  context = module.this.context
}