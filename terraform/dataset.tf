resource "google_bigquery_dataset" "dataset" {
  dataset_id    = "example_dataset"
  friendly_name = "test"
  description   = "This is a test description"
  location      = "US"

  labels = {
    env = "dev"
  }
}
