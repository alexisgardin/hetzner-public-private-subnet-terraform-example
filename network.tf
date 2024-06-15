resource "hcloud_network" "main" {
  name     = "main-network"
  ip_range = "10.0.0.0/16"
}

resource "hcloud_network_subnet" "public" {
  network_id   = hcloud_network.main.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = "10.0.1.0/24"
}

resource "hcloud_network_subnet" "private" {
  network_id   = hcloud_network.main.id
  type         = "cloud"
  network_zone = var.network_zone
  ip_range     = "10.0.2.0/24"
}
resource "hcloud_network_route" "nat_route" {
  network_id  = hcloud_network.main.id
  destination = "0.0.0.0/0"
  gateway     =  one(hcloud_server.nat_instance.network[*].ip)
}

