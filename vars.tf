variable "location" {
	default = "WestEurope"
}

variable "aks_service_principal" {
	type = "map"

	default = {
		client_id 		= "f190bd98-0a24-4aef-a32b-e678f9814995"
		client_secret 	= "a1c5fe7c-9975-4e48-bc3a-2b4550251c47"
		tenant_id		= "8a8db036-ee69-4176-aeea-bd82b7bcb7ed"
	}
}

variable "k8s-testing" {
  	type = "map"

	default = {
		name = "mug-k8s-testing-cluster"
		location = "westeurope"
		resource_group = "mug-rg-testing"
		dns_prefix = "mug-k8s-testing-cluster"
		kubernetes_version = "1.11.9"

		network_plugin        = "azure"
		service_cidr          = "10.51.12.0/24"
		dns_service_ip        = "10.51.12.10" 
		docker_bridge_cidr    = "172.17.0.1/16"
	}
}

variable "traffic_manager_ttl" {
	default = "300"
}

variable "traffic_manager_port" {
	default = 80
}

variable "traffic_manager_protocol" {
	default = "http"
}

variable "traffic_manager_path" {
	default = "/"
}

variable "application_gateway" {
  default = "mug-ag"
}
