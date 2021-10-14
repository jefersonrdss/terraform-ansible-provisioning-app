resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-ubuntu-server"
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id

  num_cpus = 2
  memory   = 1024
  guest_id = "ubuntu64Guest"

  network_interface {
    network_id = data.vsphere_network.network.id
  }

  disk {
    label = "disk0"
    size  = 20
  }

  # cdrom {
  #   path         = "ubuntu-20.04.1-live-server-amd64.iso"
  #   datastore_id = "${data.vsphere_datastore.datastore.id}"
  # }

  clone {
    template_uuid = "${data.vsphere_virtual_machine.template.id}"

    customize {
      linux_options {
        host_name = "ubuntu-server"
        domain    = "domain.local"
      }

      network_interface {
        ipv4_address = "192.168.1.2"
        ipv4_netmask = 24
      }

      ipv4_gateway = "192.168.1.1"
      dns_server_list = ["192.168.1.100", "192.168.1.101"]
    }
  }

  provisioner "remote-exec" {
    inline = [
      "id",
      "uname -a",
      "cat /etc/os-release",
      "echo \"machine-id is $(cat /etc/machine-id)\"",
      "mkdir -p ~/.ssh",
      "echo 'public-key' >> ~/.ssh/authorized_keys"
    ]

    connection {
      type = "ssh"
      user = "ubuntu"
      password = "ubuntu"
      host = self.guest_ip_addresses[0]
    }
  }
}