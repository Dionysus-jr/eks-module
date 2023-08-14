variable "cluster_name" {
  description = "The name of the EKS cluster"
  type        = string
}

variable "node_group_name" {
  description = "The name of the EKS node group"
  type        = string
}

variable "node_group_desired_size" {
  description = "The desired size of the EKS node group"
  type        = number
}

variable "node_group_min_size" {
  description = "The minimum size of the EKS node group"
  type        = number
}

variable "node_group_max_size" {
  description = "The maximum size of the EKS node group"
  type        = number
}

variable "ec2_ssh_key" {
  description = "The SSH key pair name for accessing the EKS nodes"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs for the EKS node group"
  type        = list(string)
}

variable "vpc_id" {
  description = "The ID of the VPC for the EKS node group"
  type        = string
}

variable "node_group_instance_type" {
  description = "instance types"
  type        = string
}