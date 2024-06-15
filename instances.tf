resource "hcloud_server" "bastion" {
  name        = "bastion"
  server_type = "cpx11"
  image       = var.image
  location    = var.location
  ssh_keys    = [hcloud_ssh_key.main.id]
  firewall_ids = [hcloud_firewall.ssh.id]
  network {
    network_id = hcloud_network.main.id
    ip         = "10.0.1.2"
  }

  user_data = file("bastion-cloud-init.yml")
}

resource "hcloud_server" "nat_instance" {
  name        = "nat-instance"
  server_type = "cpx11"
  image       = var.image
  location    = var.location
  ssh_keys = [hcloud_ssh_key.main.id]

  network {
    network_id = hcloud_network.main.id
    ip         = "10.0.1.10"
  }

  user_data = file("nat-cloud-init.yml")
}

resource "hcloud_server" "service_1" {
  name        = "service-1"
  server_type = "cpx11"
  image       = var.image
  location    = var.location
  ssh_keys = [hcloud_ssh_key.main.id]
  firewall_ids = [hcloud_firewall.private.id]
  user_data   = file("private-cloud-init.yml")
  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }
  network {
    network_id = hcloud_network.main.id
    ip         = "10.0.2.100"
  }
}



resource "hcloud_server" "database" {
  name        = "database"
  server_type = "ccx13"
  image       = "ubuntu-22.04"
  location    = var.location
  ssh_keys = [hcloud_ssh_key.main.id]
  firewall_ids = [hcloud_firewall.private.id]
  user_data   = file("private-cloud-init.yml")
  public_net {
    ipv4_enabled = false
    ipv6_enabled = false
  }
  network {
    network_id = hcloud_network.main.id
    ip         = "10.0.2.2"
  }

}
