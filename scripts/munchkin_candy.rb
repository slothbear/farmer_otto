# assume:
# tin man fountain is open
# Feeding Stall is ready (2 min)
# Enchantment Pool is ready (2 min)
# collection bins are empty

# TODO:
# make the munchkin candy before selling previous
# tighten up the timing. (can I detect how fast? or dynamic?)

activate_farm
count = 60

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  tin_man_fountain :tm_feeding_stall
  tin_man_fountain :tm_enchantment_pool
  wait 2.0
  tin_man_fountain :tm_feeding_stall
  tin_man_fountain :tm_enchantment_pool

  # sell previous munchkin candy
  unless run_number == 0
    tin_man_fountain :tm_feeding_enclosure # harvest
    # that harvest puts up the upgrade button, which covers over
    # the play_area button. Add click to neutral area to clear
    # upgrade button.
    tin_man_fountain :tm_title_bar # move off of button dialog
    tin_man_fountain :tm_play_area, :tm_sell_1
    tin_man_fountain :tm_accept, :tm_close_play_area
  end

  # make a munchkin candy
  tin_man_fountain :tm_feeding_enclosure, :tm_make_2

  # wait for munchkin candy in next run
  wait 3 unless run_number == count-1
end
