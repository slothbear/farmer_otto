wait 0.1
activate_farm

# There are currently 15 farms with standard craftshops.
15.times do
  travel_to_least_recent_farm
  close_farm_cash_offer

  craftshop :open
  craftshop :get_it,    count: 8
  craftshop :drill_bit, count: 8
  craftshop :close
end
