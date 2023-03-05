/*
Copyright 2023 The Kubernetes Authors.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

variable "vpc_cidr" {
  type        = string
  description = "CIDR of the VPC"
}

variable "vpc_secondary_cidr_blocks" {
  type        = list(string)
  description = "Additional CIDRs to attach to the VPC"
}

variable "vpc_public_subnet" {
  type        = list(string)
  description = "Public subnets (one per AZ)"
}

variable "vpc_private_subnet" {
  type        = list(string)
  description = "Private subnets (one per AZ)"
}

variable "vpc_intra_subnet" {
  type        = list(string)
  description = "Intra subnets (one per AZ, subnet without access to external services)"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

variable "cluster_region" {
  type        = string
  description = "AWS region of the EKS cluster"
}

variable "cluster_version" {
  type        = string
  description = "Kubernetes version of the EKS cluster"
}

variable "node_ami" {
  type        = string
  description = "EKS optimized AMI to be used for Node groups"
}

variable "node_instance_types" {
  type        = list(string)
  description = "Instance sizes to use for EKS node group"
}

variable "node_volume_size" {
  type        = number
  description = "Volume size per node to use for EKS node group"
}

variable "node_min_size" {
  type        = number
  description = "Minimum number of nodes in the EKS node group"
}

variable "node_max_size" {
  type        = number
  description = "Maximum number of nodes in the EKS node group"
}

variable "node_desired_size" {
  type        = number
  description = "Desired number of nodes in the EKS node group"
}

variable "node_max_unavailable_percentage" {
  type        = number
  description = "Maximum unavailable nodes in a node group"
}

variable "cluster_autoscaler_version" {
  type        = string
  description = "Cluster Autoscaler version to use (must match the EKS version)"
}
