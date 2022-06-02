terraform {
  required_providers {
    ionoscloud = {
      source = "ionos-cloud/ionoscloud"
      version = "= 6.2.1"
    }
  }
}

provider "ionoscloud" {
  username = "16_9T1N93gCdJ@itohm.de"
  password = "!;0H3;Sl;u"
}

# export TF_VAR_ionos_username="username"
# export TF_VAR_ionos_password="password"
# export IONOS_API_URL="api-url"