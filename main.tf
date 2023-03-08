# Create amazonec2 machine config v2
resource "rancher2_machine_config_v2" "meu-cluster-modafoca" {
  generate_name = "meu-cluster-modafoca"
  amazonec2_config {
    ami            = "ami-077518a464c82703b" ### Same for Ranher latest on AWS.
    region         = var.aws_region
    instance_type  = var.aws_instance_type
    security_group = [var.aws_sg]
    subnet_id      = var.subnet_id
    vpc_id         = var.vpc_id
    zone           = var.zone_letter
  }
}

# Create a new rancher v2 amazonec2 RKE2 Cluster v2
resource "rancher2_cluster_v2" "meu-cluster-modafoca" {
  name                                     = "meu-cluster-modafoca"
  kubernetes_version                       = var.kubernetes_version
  fleet_namespace                          = "fleet-default"
  enable_network_policy                    = false
  default_cluster_role_for_project_members = "user"
  depends_on = [
    rancher2_cloud_credential.rancher-labs
  ]
  rke_config {
    machine_pools {
      name                         = "cp"
      cloud_credential_secret_name = rancher2_cloud_credential.rancher-labs.id
      control_plane_role           = true
      etcd_role                    = true
      worker_role                  = true
      quantity                     = 3
      machine_config {
        kind = rancher2_machine_config_v2.meu-cluster-modafoca.kind
        name = rancher2_machine_config_v2.meu-cluster-modafoca.name
      }
    }
    machine_global_config = <<EOF
---
cni: cilium
EOF
  }
}
