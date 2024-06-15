
resource "hcloud_firewall" "ssh" {
  name = "ssh-firewall"
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = ["0.0.0.0/0"]
  }
}

resource "hcloud_firewall" "private" {
  name = "private-firewall"

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = ["10.0.1.0/24"]  # Only allow SSH from public subnet
  }
}
