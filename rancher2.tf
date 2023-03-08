resource "rancher2_cloud_credential" "rancher-labs" {
  name = "rancher-labs"
  amazonec2_credential_config {
    access_key = var.aws_access_key
    secret_key = var.aws_secret_key
  }
}
