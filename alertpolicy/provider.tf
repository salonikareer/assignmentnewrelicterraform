terraform {
  required_providers {
    newrelic = {
      source = "newrelic/newrelic"
    }
  }
}


provider "newrelic" {
  account_id = 4038255
  api_key    = "NRAK-RH28YY4XCFQ3TGNQ23FRFK561TC"
  region     = "EU"
}