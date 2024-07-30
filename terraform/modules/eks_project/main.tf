locals {
  enabled = module.this.enabled

  private_ipv6_enabled = var.private_ipv6_enabled

  # The usage of the specific kubernetes.io/cluster/* resource tags below are required
  # for EKS and Kubernetes to discover and manage networking resources
  # https://aws.amazon.com/premiumsupport/knowledge-center/eks-vpc-subnet-discovery/
  # https://github.com/kubernetes-sigs/aws-load-balancer-controller/blob/main/docs/deploy/subnet_discovery.md
  tags = { "kubernetes.io/cluster/${module.label.id}" = "shared" }

  # required tags to make ALB ingress work https://docs.aws.amazon.com/eks/latest/userguide/alb-ingress.html
  public_subnets_additional_tags = {
    "kubernetes.io/role/elb" : 1
  }
  private_subnets_additional_tags = {
    "kubernetes.io/role/internal-elb" : 1
  }

  # Enable the IAM user creating the cluster to administer it,
  # without using the bootstrap_cluster_creator_admin_permissions option,
  # as a way to test the access_entry_map feature.
  # In general, this is not recommended. Instead, you should
  # create the access_entry_map statically, with the ARNs you want to
  # have access to the cluster. We do it dynamically here just for testing purposes.
  access_entry_map = {
    (data.aws_iam_session_context.current.issuer_arn) = {
      access_policy_associations = {
        ClusterAdmin = {}
      }
    }
  }

  # https://docs.aws.amazon.com/eks/latest/userguide/managing-vpc-cni.html#vpc-cni-latest-available-version
  vpc_cni_addon = {
    addon_name               = "vpc-cni"
    addon_version            = null
    resolve_conflicts        = "OVERWRITE"
    service_account_role_arn = one(module.vpc_cni_eks_iam_role[*].service_account_role_arn)
  }

  addons = concat([
    local.vpc_cni_addon
  ], var.addons)
}