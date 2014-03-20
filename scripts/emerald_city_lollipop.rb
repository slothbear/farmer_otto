# assume:
# tin man fountain is open
# Feeding Stall is ready (2 min)

wait 0.1
activate_farm

count = 8

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  tin_man_fountain :tm_feeding_stall  # 1st magic feed
  wait 2
  tin_man_fountain :tm_feeding_stall  # 2nd magic feed
  # make a winkie grain
  tin_man_fountain :tm_feeding_enclosure, :tm_make_1

  3.times do |ix|    # 3 more magic feed & 6 minutes
    wait 2
    tin_man_fountain :tm_feeding_stall  # 1st magic feed
  end

  # sell previous lollipop
  unless run_number == 0
    tin_man_fountain :tm_feeding_enclosure
    tin_man_fountain :tm_play_area, :tm_sell_1
    tin_man_fountain :tm_accept, :tm_close_play_area
  end

  tin_man_fountain :tm_feeding_enclosure, :tm_make_1
  # wait for magic feed in next run
  wait 2 unless run_number == count-1
end
