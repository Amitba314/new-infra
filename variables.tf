
variable "cluster_id" {
  description = "Name of the EKS cluster where the ingress nginx will be deployed"
  type        = string
}

variable "update_image_tag" {
  description = "The actual new image tag for the new image base on commit id"
  type        = string
}
