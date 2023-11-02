
resource "newrelic_alert_policy" "my_policy" {
  name                = "Saloni_policy"
  incident_preference = "PER_POLICY" # PER_POLICY is default
}
 
 

resource "newrelic_nrql_alert_condition" "alert_condition1" {
 
  policy_id                      = newrelic_alert_policy.my_policy.id
  type                           = "static"
  name                           = "workflow_alertcondition"
  description                    = "Alert when transactions are taking too long"
  enabled                        = true
 
 
  nrql {
   query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'NDAzODI1NXxJTkZSQXxOQXwzMjc0NDkyOTg5Mzc0NTY3MjM5'"
  }
 
  critical {
    operator              = "above"
    threshold             = 5.5
    threshold_duration    = 300
    threshold_occurrences = "ALL"
  }
 
  warning {
    operator              = "above"
    threshold             = 3.5
    threshold_duration    = 600
    threshold_occurrences = "ALL"
  }
}
 
//destination
 
resource "newrelic_notification_destination" "my_destination" {
  account_id = 4038255
  name       = "destination_workflow"
  type       = "EMAIL"
 
  property {
    key   = "email"
    value = "salomilareer60@gmail.com"
  }
 
  auth_basic {
    user     = "username"
    password = "password"
  }
}
 
 
 
 
 
//channel
resource "newrelic_notification_channel" "my_channel" {
  account_id     = 4038255
  name           = "channel-saloni"
  type           = "EMAIL"
  destination_id = newrelic_notification_destination.my_destination.id
  product        = "IINT" // (Workflows)
 
  // must be valid json
  property {
    key   = "payload"
    value = "{}"
    label = "Payload Template"
  }
}
 
 
 
 
 
 
//workflow
 
resource "newrelic_workflow" "my_workflow" {
  name                  = "Saloni_workflow"
  muting_rules_handling = "NOTIFY_ALL_ISSUES"
 
  issues_filter {
    name = "filter-name"
    type = "FILTER"
 
    predicate {
      attribute = "accumulations.tag.team"
      operator  = "EXACTLY_MATCHES"
      values    = ["growth"]
    }
  }
 
  destination {
    channel_id = newrelic_notification_channel.my_channel.id
  }
}