module "subnets" {
  source  = "cloudposse/dynamic-subnets/aws"
  version = "2.4.2"

  availability_zones              = var.availability_zones
  vpc_id                          = module.vpc.vpc_id
  igw_id                          = [module.vpc.igw_id]
  ipv4_cidr_block                 = [module.vpc.vpc_cidr_block]
  ipv6_cidr_block                 = [module.vpc.vpc_ipv6_cidr_block]
  ipv6_enabled                    = true
  max_nats                        = 1
  nat_gateway_enabled             = true
  nat_instance_enabled            = false
  tags                            = local.tags
  public_subnets_additional_tags  = local.public_subnets_additional_tags
  private_subnets_enabled         = true
  private_subnets_additional_tags = local.private_subnets_additional_tags

  context = module.this.context
}