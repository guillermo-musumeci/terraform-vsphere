# ======================== #
# VMware VMs configuration #
# ======================== #

vm-count = "2"
vm-name = "kopik8snode"
vm-template-name = "CentOS7-Template"
vm-cpu = 2
vm-ram = 4096
vm-guest-id = "centos7_64Guest"

# ============================ #
# VMware vSphere configuration #
# ============================ #

# VMware vCenter IP/FQDN
vsphere-vcenter = "10.100.123.10"

# VMware vSphere username used to deploy the infrastructure
vsphere-user = "administrator@kopicloud.local"

# VMware vSphere password used to deploy the infrastructure
vsphere-password = "Th1sIsN0tAPassw0rd"

# Skip the verification of the vCenter SSL certificate (true/false)
vsphere-unverified-ssl = "true"

# vSphere datacenter name where the infrastructure will be deployed
vsphere-datacenter = "KopiCloud-DC"

# vSphere cluster name where the infrastructure will be deployed
vsphere-cluster = "KopiCloud-Cluster"

# vSphere Datastore used to deploy VMs 
vm-datastore = "KopiCloud-Datastore-01"

# vSphere Network used to deploy VMs 
vm-network = "VM Network"

# Linux virtual machine domain name
vm-domain = "kopicloud.local"
