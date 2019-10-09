#=====================#
# Deploying VMware VM #
#=====================#

# Connect to VMware vSphere vCenter
provider "vsphere" {
  user           = "${var.vsphere-user}"
  password       = "${var.vsphere-password}"
  vsphere_server = "${var.vsphere-vcenter}"

  # If you have a self-signed cert
  allow_unverified_ssl = "${var.vsphere-unverified-ssl}"
}

# Define VMware vSphere 
data "vsphere_datacenter" "dc" {
  name = "${var.vsphere-datacenter}"
}

data "vsphere_datastore" "datastore" {
  name          = "${var.vm-datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_compute_cluster" "cluster" {
  name          = "${var.vsphere-cluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data "vsphere_network" "network" {
  name          = "${var.vm-network}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

resource "vsphere_virtual_machine" "vm" {
  name             = "terraform-test-vm-01"
  resource_pool_id = "${data.vsphere_compute_cluster.cluster.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.datastore.id}"

  num_cpus = 1
  memory   = 1024
  guest_id = "CentOS64Guest"

  network_interface {
    network_id = "${data.vsphere_network.network.id}"
  }

  disk {
    label = "disk0"
    size  = 20
  }
}
