/////////////////////////////////////////////////////
// Specifying the bucket to store the remote state //
/////////////////////////////////////////////////////

terraform {
  backend "gcs" {
    bucket  = "green-k8s-terraform-state"
    prefix  = "green-k8s"
  }
}