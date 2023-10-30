# resource "newrelic_workload" "Saloni-workload" {
#     name = "workload-saloni"
#     account_id = 4038255

#     entity_guids = ["NDAzODI1NXxCUk9XU0VSfEFQUExJQ0FUSU9OfDUzODUyNzA0Ng"]
# }

#     entity_search_query {
#         query = "name like '%Example application%'"
#     }

#     scope_account_ids =  [12345678]
# }

resource "newrelic_workload" "Saloni01_workload" {
    for_each = var.workload
    name=each.value.name
    account_id =each.value.account_id
   entity_guids = each.value.entity_guids
}






