data "vsphere_datacenter" "dc" {
  name = "datacenter_name"
}

data "vsphere_datastore" "datastore" {
  name          = "datastore_name"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name          = "host/Resources"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name          = "VM Network"
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "template" {
  name          = "ubuntu-server-20-04"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}