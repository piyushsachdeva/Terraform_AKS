# Datasource to get Latest Azure AKS latest Version
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
  include_preview = false  
}
 

resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                  = "techtutorialwithpiyush-aks-cluster"
  location              = var.location
  resource_group_name   = var.resource_group_name
  dns_prefix            = "${var.resource_group_name}-cluster"           
  kubernetes_version    =  data.azurerm_kubernetes_service_versions.current.latest_version
  node_resource_group = "${var.resource_group_name}-nrg"
  
  default_node_pool {
    name       = "defaultpool"
    vm_size    = "Standard_DS2_v2"
    zones   = [1, 2, 3]
    enable_auto_scaling  = true
    max_count            = 3
    min_count            = 1
    os_disk_size_gb      = 30
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "prod"
      "nodepoolos"       = "linux"
     } 
   tags = {
      "nodepool-type"    = "system"
      "environment"      = "prod"
      "nodepoolos"       = "linux"
   } 
  }

  service_principal  {
    client_id = var.client_id
    client_secret = var.client_secret
  }



  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
        key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
      network_plugin = "azure"
      load_balancer_sku = "standard"
  }

    
  }


