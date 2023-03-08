resource "aws_security_group" "rke2-ports-cluster" {
  name        = "rke2-cluster-terraform"
  description = "RKE2 cluster created by terraform"
  vpc_id      = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "rke2-ports-cluster"
    DoNotDelete = "true"
    Owner       = "tbernacchi"
    Created_by  = "Terraform"
  }

}

resource "aws_security_group_rule" "rke2-agents" {
  type              = "ingress"
  description       = "RKE2 agent nodes - Kubernetes API"
  from_port         = 9345
  to_port           = 9345
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-k8s-api" {
  type              = "ingress"
  description       = "RKE2 agent nodes - Kubernetes API"
  from_port         = 6443
  to_port           = 6443
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-flannel" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Cilium CNI VXLAN"
  from_port         = 8472
  to_port           = 8472
  protocol          = "udp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-kubelet" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - kubelet"
  from_port         = 10250
  to_port           = 10250
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-etcd" {
  type              = "ingress"
  description       = "RKE2 server nodes - etcd client port"
  from_port         = 2379
  to_port           = 2380
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-nodeport" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - NodePort port range"
  from_port         = 30000
  to_port           = 32767
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-cilium" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Cilium CNI health checks"
  from_port         = 4240
  to_port           = 4240
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-icmp" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Cilium CNI health checks"
  from_port         = 8
  to_port           = 0
  protocol          = "icmp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-calico" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Calico CNI with BGP"
  from_port         = 179
  to_port           = 179
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-calico-vxlan" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Calico CNI with VXLAN"
  from_port         = 4789
  to_port           = 4789
  protocol          = "udp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-calico-typha" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Calico CNI with Typha"
  from_port         = 5473
  to_port           = 5473
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-calico-typha-healthchecks" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Calico Typha health checks"
  from_port         = 9098
  to_port           = 9098
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-calico-healthchecks" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Calico health checks"
  from_port         = 9099
  to_port           = 9099
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-cni-wireguard" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Canal CNI with Wireguard IPv4"
  from_port         = 51820
  to_port           = 51820
  protocol          = "udp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-cni-wireguardipv6" {
  type              = "ingress"
  description       = "RKE2 server and agent nodes - Canal CNI with Wireguard IPv6/dual-stack"
  from_port         = 51821
  to_port           = 51821
  protocol          = "udp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-cilium-operator-metrics" {
  type              = "ingress"
  description       = "Cilium CNI operator metrics"
  from_port         = 6942
  to_port           = 6942
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "rke2-cilium-operator-healthcheck" {
  type              = "ingress"
  description       = "Cilium CNI address to serve API requests"
  from_port         = 9234
  to_port           = 9234
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}

resource "aws_security_group_rule" "http-to-rancher-ui" {
  type              = "ingress"
  description       = "Rancher UI - https"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = var.cidr
  security_group_id = aws_security_group.rke2-ports-cluster.id
}
