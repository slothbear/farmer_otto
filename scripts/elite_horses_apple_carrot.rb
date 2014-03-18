# assume:
# elite horses is open

wait 0.1
activate_farm

count = 14
count.times do |run_number|
  elite_horses :feed_wagon, :water_pump
  # 2 minutes for feed&water, +1 for
  # previous Apple Carrot Crate to ready
  wait 3

  elite_horses :feed_wagon, :water_pump

  elite_horses :feeding_stall
  elite_horses :feeding_stall, :eh_make_2
  wait 2
end
