# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "boostrap_acl_token" {
  type        = string
  description = "The ACL bootstrap token used to create necessary ACL tokens for the Helm chart"
}

variable "region" {
  type        = string
  description = "AWS region"
}

variable "eks_cluster_id" {
  type        = string
  description = "Cluster ID of EKS"
}

variable "gossip_encryption_key" {
  type        = string
  description = "The gossip encryption key of the Consul cluster"
}

variable "consul_ca_file" {
  type        = string
  description = "The Consul CA certificate bundle used to validate TLS connections"
}

variable "datacenter" {
  type        = string
  description = "The name of the Consul datacenter that client agents should register as"
}

variable "consul_hosts" {
  type        = list(string)
  description = "A list of DNS addresses that clients should use to join the Consul cluster"
}

variable "k8s_api_endpoint" {
  type        = string
  description = "The Kubernetes API endpoint for the Kubernetes cluster"
}

variable "hcp_cluster_id" {
  type        = string
  description = "The ID of the Consul cluster that is managing the clients"
}

variable "consul_version" {
  type        = string
  description = "The Consul version of the HCP servers"
}

variable "chart_version" {
  type        = string
  description = "The Consul Helm chart version to use"
  default     = "0.46.0"
}

variable "api_gateway_version" {
  type        = string
  description = "The Consul API gateway image version to use"
  default     = "0.3.0"
}

variable "security_group" {}
