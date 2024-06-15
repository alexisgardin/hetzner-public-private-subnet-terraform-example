resource "hcloud_ssh_key" "main" {
  name      = var.public_ssh_key_name
  public_key = var.public_ssh_key
}
