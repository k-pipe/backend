/////////////////////////////
// Using google provider   //
/////////////////////////////

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.34.0"
    }
  }
}


