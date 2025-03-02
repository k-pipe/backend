/////////////////////////////////////////////////////////
// Input variables: coordinates of gcp infrastructure  //
/////////////////////////////////////////////////////////

variable "project_id" {
  type = string
  description = "the gcp project in which the backend will reside"
}

variable "dataset_location" {
  type = string
  description = "the gcp location into which the dataset will be placed"
}

