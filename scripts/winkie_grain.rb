# assume:
# tin man fountain is open
# Feeding Stall is ready (2 min)

wait 0.1
activate_farm

count = 86

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  tin_man_fountain :tm_feeding_stall
  wait 3
  tin_man_fountain :tm_feeding_stall  # 2nd magic grain

  unless run_number == 0
    tin_man_fountain :tm_feeding_enclosure
    tin_man_fountain :tm_play_area, :tm_sell_1
    tin_man_fountain :tm_accept, :tm_close_play_area
  end

  tin_man_fountain :tm_feeding_enclosure, :tm_make_1
  wait 2
end
