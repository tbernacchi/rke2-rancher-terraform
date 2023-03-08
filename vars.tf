variable "rancher2_token_key" {
  default = "YOUR-BEAUTIFUL-BEARER-TOKEN"
} 

variable "aws_access_key" {
  default = "YOUR-BEAUTIFUL-ACCESS-KEY" 
}

variable "aws_secret_key" {
  default = "YOUR-BEAUTIFUL-SECRET-KEY"
}

variable "rancher_url" {
  default = "https://mybeautifulrancher.com/"
}

variable "aws_region" {
  default = "sa-east-1"
}

variable "zone_letter" {
  default = "a"
}

variable "vpc_id" {
  default = "vpc-199e347e"
}

variable "subnet_id" {
  default = "subnet-b8cfe0df"
}

variable "aws_sg" {
  default = "rke2-cluster-terraform"
}

variable "aws_instance_type" {
  default = "t3a.large"
}

variable "kubernetes_version" {
  default = "v1.23.8+rke2r1"
}

