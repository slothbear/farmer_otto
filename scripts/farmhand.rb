wait 0.1
activate_farm

# There are currently 15 farms with standard craftshops.
1.times do
  travel_to_least_recent_farm
  close_farm_cash_offer

  craftshop :open
  craftshop :get_it,    count: 8
  craftshop :farmhand, count: 8
  craftshop :close
end
