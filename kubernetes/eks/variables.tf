
variable "aws_region" {
  description = "The AWS region in which to create the EKS cluster."
  type        = string
}

variable "cluster_name" {
  description = "The name of the EKS cluster."
  type        = string
}

variable "vpc_id" {
  description = "VPC ID which is going to deploy."
  type        = string
}
variable "kubernetes_version" {
  description = "The desired Kubernetes version for the EKS cluster."
  type        = string
}

variable "cluster_enabled_log_types" {
  description = "A list of the desired control plane logs to enable. For more information, see Amazon EKS Control Plane Logging documentation (https://docs.aws.amazon.com/eks/latest/userguide/control-plane-logs.html)"
  type        = list(string)
  default     = ["audit", "api", "authenticator"]
}

variable "subnet_ids" {
  description = "A list of subnet IDs where the EKS cluster and node group will be launched."
  type        = list(string)
}

variable "addons" {
  description = "A list of addons to enable for the EKS cluster"
  type        = list(map(string))
  default     = []
}

variable "encryption_config" {
  description = "Encryption configuration for the EKS cluster"
  type = list(object({
    description = string
    resources   = list(string)
  }))
  default = [
    {
      description = "Encryption for secrets"
      resources   = ["secrets"]
    }
  ]
}
