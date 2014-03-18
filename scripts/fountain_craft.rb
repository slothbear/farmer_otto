sleep 5.0
activate_farm

standard_farm_count.times do
  travel_to_least_recent_farm
  close_farm_cash_offer
  craftshop :open
  craftshop :get_it, count: 8

  # A Wishing Fountain stage requires twice as many drill bits
  # as the other parts; make parts in that proportion.
  craftshop :drill_bit,   count: 4
  craftshop :cut_bamboo,  count: 2
  craftshop :copper_tube, count: 2

  craftshop :close
end
