resource "ionoscloud_datacenter" "amardeep-dc" {
  name                  = "Cloud-engineer-dc"
  location              = "de/txl"
  description           = "DC for hosting k8s cluster"
}

resource "ionoscloud_lan" "amardeep-lan" {
  datacenter_id         = ionoscloud_datacenter.amardeep-dc.id
  public                = false
  name                  = "Lan's ID for node pool"
}

resource "ionoscloud_ipblock" "node-ip" {
  location              = "de/txl"
  size                  = 2
  name                  = "IP Block for node pool"
}

resource "ionoscloud_k8s_cluster" "k8sCluster" {
  name                  = "k8sCluster-amardeep"
  k8s_version           = "1.22.6"
  public                = true
  
}

resource "ionoscloud_k8s_node_pool" "example" {
  datacenter_id         = ionoscloud_datacenter.amardeep-dc.id
  k8s_cluster_id        = ionoscloud_k8s_cluster.k8sCluster.id
  name                  = "k8sNodePool"
  k8s_version           = ionoscloud_k8s_cluster.k8sCluster.k8s_version

  cpu_family            = "INTEL_SKYLAKE"
  availability_zone     = "AUTO"
  storage_type          = "SSD"
  node_count            = 1
  cores_count           = 4
  ram_size              = 4096
  storage_size          = 50
  public_ips            = [ ionoscloud_ipblock.node-ip.ips[0], ionoscloud_ipblock.node-ip.ips[1] ]
  lans {
    id                  = ionoscloud_lan.amardeep-lan.id
    dhcp                = true
    routes {
       network          = "1.2.3.5/24"
       gateway_ip       = "10.1.5.17"
     }
   }  
  labels                = {
    job                 = "cloud-engineer"
    owner                = "Amardeep"
  }
}

output "datacenter_id" {
  value = ionoscloud_datacenter.amardeep-dc.id
}

output "datacenter_lan" {
  value = ionoscloud_lan.amardeep-lan.id
}

