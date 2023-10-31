resource "newrelic_one_dashboard" "Saloni_dashboard" {
  for_each    = var.mydashboard
  name        = each.value.name
  permissions = each.value.permissions
  page {
    name = each.value.page.name
    widget_billboard {
      title  = each.value.page.widget_billboard.title
      row    = each.value.page.widget_billboard.row
      column = each.value.page.widget_billboard.column
      width  = each.value.page.widget_billboard.width
      height = each.value.page.widget_billboard.height

      nrql_query {
        query = each.value.page.widget_billboard.nrql_query.query
      }
    }

    widget_bar {
      title  = each.value.page.widget_bar.title
      row    = each.value.page.widget_bar.row
      column = each.value.page.widget_bar.column
      width  = each.value.page.widget_bar.width
      height = each.value.page.widget_bar.height

      nrql_query {
        account_id = each.value.page.widget_bar.nrql_query.account_id
        query      = each.value.page.widget_bar.nrql_query.query
      }
    }
  }
}