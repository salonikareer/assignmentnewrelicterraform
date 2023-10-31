resource "newrelic_service_level" "foo" {
    guid = "NDAzODI1NXxCUk9XU0VSfEFQUExJQ0FUSU9OfDUzODUyNzA0Ng"
    name = "Latency"
    description = "Proportion of requests that are served faster than a threshold."

    events {
        account_id = 4038255
        valid_events {
            from = "Transaction"
            where = "appName = 'Example application' AND (transactionType='Web')"
        }
        bad_events {
            from = "Transaction"
            where = "appName = 'Example application' AND (transactionType= 'Web') AND duration < 0.1"
        }
    }

    objective {
        target = 99.00
        time_window {
            rolling {
                count = 7
                unit = "DAY"
            }
        }
    }
}
