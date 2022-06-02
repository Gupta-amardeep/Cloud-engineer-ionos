terraform {
  required_providers {
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "= 6.2.1"
    }
  }
}

provider "ionoscloud" {
  username = ""
  password = ""
}

# export TF_VAR_ionos_username="username"
# export TF_VAR_ionos_password="password"
# export IONOS_API_URL="api-url"
