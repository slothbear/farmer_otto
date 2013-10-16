# assume:
# elite horses is open
# Feeding Stall is ready (5 min)
# Feed Wagon is ready (2 min)
# 1 Feed already in Stable Loft

wait 0.1
elite_horses :eh_activate_farmville_window

count = 5
count.times do |run_number|
  elite_horses :feed_wagon, :water_pump
  # 2 minutes for feed&water, +1 for
  # previous Apple Carrot Crate to ready
  wait 3

  elite_horses :feeding_stall unless run_number == 0 # HARVEST

  elite_horses :feed_wagon, :water_pump
  elite_horses :feeding_stall, :eh_make_2
  wait 2
end
