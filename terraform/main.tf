provider "google" {
  project = var.project_id
  region  = "us-central1"
}

#terraform { 
#  backend "gcs" {   
#    bucket  = "${var.backend_bucket}"
#    prefix = "${var.env}"
#    project = "<YOUR PROJECT ID>" 
#  }
#}

resource "google_data_catalog_policy_tag" "basic_policy_tag_high" {
  provider     = google-beta
  taxonomy     = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "High"
  description  = "A policy tag for high security items"
}

resource "google_data_catalog_policy_tag" "basic_policy_tag_low" {
  provider     = google-beta
  taxonomy     = google_data_catalog_taxonomy.my_taxonomy.id
  display_name = "Low"
  description  = "A policy tag for low security items"
}

resource "google_data_catalog_taxonomy" "my_taxonomy" {
  provider               = google-beta
  region                 = "us"
  display_name           = "test-taxonomy"
  description            = "A collection of policy tags"
  activated_policy_types = ["FINE_GRAINED_ACCESS_CONTROL"]
}
