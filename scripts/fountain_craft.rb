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
  4.times do
    craftshop :drill_bit
  end

  2.times do
    craftshop :cut_bamboo
  end

  2.times do
    craftshop :copper_tube
  end

  craftshop :close
end
