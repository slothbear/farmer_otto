sleep 5.0

standard_farm_count.times do
  travel_to_least_recent_farm
  craftshop :open

  # If your craftshop has fewer than 8 stations, the extra
  # get_it clicks will land in neutral space.
  8.times do
    craftshop :get_it
  end

  # A Wishing Fountain stage requires twice as many drill bits
  # as the other parts; make parts in that proportion.
  # craftshop :drill_bit,   count: 4
  # craftshop :cut_bamboo,  count: 2
  # craftshop :copper_tube, count: 2

  # Making one kind of part at a time needs fewer kinds of bushels.
  craftshop :drill_bit, count: 8

  craftshop :close
end
