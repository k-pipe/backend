# Sets up an orchestrator instance used for testing

module "infrastructure" {
  source = "infrastructure"
  project_id = "green-k8s"
  dataset_location = "eu"
}