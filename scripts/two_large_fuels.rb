wait 0.1
activate_farm

# There are currently 15 farms with standard craftshops.
farm_count = 1 # 15
farm_count.times do |farm_index|
  craftshop :open
  craftshop :get_it, count: 8
  craftshop :two_large_fuels, count: 8
  craftshop :close

  # Don't travel to next farm from the last farm.
  if farm_index+1 < farm_count
    travel_to_least_recent_farm
    close_farm_cash_offer
  end
end
