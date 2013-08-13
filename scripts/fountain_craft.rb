standard_farm_count.times do
  travel_to_least_recent_farm
  craftshop :open

  # If your craftshop has fewer than 8 stations, the extra
  # get_it clicks will land in neutral space.
  8.times do
    craftshop :get_it
  end

  # Make twice as many drill bits since a Wishing Fountain stage
  # requires 8 drill bits, 4 cut bamboos, and 4 copper tubes.
  craftshop :drill_bit,   count: 4
  craftshop :cut_bamboo,  count: 2
  craftshop :copper_tube, count: 2

  craftshop :close
end
