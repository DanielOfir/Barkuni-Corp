variable "kubernetes_alb_controller_enabled" {
  description = "Enable AWS Load Balancer Controller"
  type        = bool
  default     = false
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
  default     = null
}

variable "cluster_identity_oidc_issuer_arn" {
  description = "OIDC issuer ARN for the EKS cluster"
  type        = string
  default     = null
}

variable "cluster_identity_oidc_issuer" {
  description = "OIDC issuer URL for the EKS cluster"
  type        = string
  default     = null
}

variable "namespace" {
  description = "Namespace for the service account"
  type        = string
  default     = "kube-system"
}

variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
  default     = null
}

variable "service_account_name" {
  description = "Name of the service account"
  type        = string
  default     = "aws-load-balancer-controller"
}

variable "eks_cluster_endpoint" {
  description = "EKS cluster endpoint"
  type        = string
  default     = null
}

variable "eks_cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = null
}

variable "eks_cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  type        = string
  default     = null
}