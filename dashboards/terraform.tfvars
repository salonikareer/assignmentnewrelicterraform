mydashboard = {
  "dashboard-01" = {
    name       = "first_dashboard"
    permissions = "public_read_only"
    page = {
      name = "page-1"
      widget_billboard = {
        title  = "chart-1"
        row    = 1
        column = 1
        width  = 6
        height = 3
        nrql_query = {
          query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'NDAzODI1NXxJTkZSQXxOQXwzMjc0NDkyOTg5Mzc0NTY3MjM5' "
        }


      }
      widget_bar = {
        title  = "chart-2"
        row    = 1
        column = 7
        width  = 6
        height = 3
        nrql_query = {
          account_id = ******
          query      = "SELECT average(host.disk.usedPercent) as 'Storage used %' FROM Metric WHERE `entityGuid` = 'NDAzODI1NXxJTkZSQXxOQXwzMjc0NDkyOTg5Mzc0NTY3MjM5'"
        }
      }
    }

  }
  "dashboard-02" = {
    name       = "second_dashboard"
    permissions = "public_read_only"
    page = {
      name = "page-1"
      widget_billboard = {
        title  = "chart-1"
        row    = 1
        column = 1
        width  = 6
        height = 3
        nrql_query = {
          query = "SELECT average(host.cpuPercent) AS 'CPU used %' FROM Metric WHERE `entityGuid` = 'NDAzODI1NXxJTkZSQXxOQXwzMjc0NDkyOTg5Mzc0NTY3MjM5' "
        }


      }
      widget_bar = {
        title  = "chart-2"
        row    = 1
        column = 7
        width  = 6
        height = 3
        nrql_query = {
          account_id = *******
          query      = "SELECT average(host.disk.usedPercent) as 'Storage used %' FROM Metric WHERE `entityGuid` = 'NDAzODI1NXxJTkZSQXxOQXwzMjc0NDkyOTg5Mzc0NTY3MjM5'"
        }
      }
    }

  }
}