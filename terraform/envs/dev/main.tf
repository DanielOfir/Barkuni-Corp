module "eks_project" {
  source = "../../modules/eks_project"

  region    = var.region
  stage     = var.stage
  name      = var.name
  namespace = var.namespace

  # EKS cluster
  oidc_provider_enabled             = var.oidc_provider_enabled
  enabled_cluster_log_types         = var.enabled_cluster_log_types
  cluster_log_retention_period      = var.cluster_log_retention_period
  kubernetes_labels                 = var.kubernetes_labels
  cluster_encryption_config_enabled = var.cluster_encryption_config_enabled
  kubernetes_version                = var.kubernetes_version
  private_ipv6_enabled              = var.private_ipv6_enabled
  addons                            = var.addons

  # Node Groups
  desired_size            = var.desired_size
  min_size                = var.min_size
  max_size                = var.max_size
  instance_types          = var.instance_types
  availability_zones      = var.availability_zones

  # VPC
  ipv4_primary_cidr_block = var.ipv4_primary_cidr_block
}

module "aws-load-balancer-controller" {
  source = "../../modules/aws-load-balancer-controller"

  kubernetes_alb_controller_enabled      = var.kubernetes_alb_controller_enabled

  eks_cluster_endpoint                   = module.eks_project.eks_cluster_endpoint
  eks_cluster_certificate_authority_data = module.eks_project.eks_cluster_certificate_authority_data

  cluster_name                           = module.eks_project.eks_cluster_id
  cluster_identity_oidc_issuer_arn       = module.eks_project.eks_cluster_identity_oidc_issuer_arn
  cluster_identity_oidc_issuer           = module.eks_project.eks_cluster_identity_oidc_issuer

  # namespace                              = var.aws_load_balancer_controller_namespace
  namespace                              = var.namespace
  vpc_id                                 = module.eks_project.vpc_id
  region                                 = var.region
}