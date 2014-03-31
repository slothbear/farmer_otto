# assume:
# tin man fountain is open
# Enchantment Pool is ready (2 min)

# collection bins are empty

activate_farm
count = 17

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  tin_man_fountain :tm_enchantment_pool  # 1st enchanted water
  wait 2.0

  # sell previous large drinking bowl
  unless run_number == 0
    tin_man_fountain :tm_water_enclosure # harvest
    # that harvest puts up the upgrade button, which covers over
    # the play_area button. Add click to neutral area to clear
    # upgrade button.
    tin_man_fountain :tm_title_bar # move off of button dialog
    tin_man_fountain :tm_play_area, :tm_sell_1
    tin_man_fountain :tm_accept, :tm_close_play_area
  end

  tin_man_fountain :tm_enchantment_pool  # 2nd enchanted water
  # make a small drinking bowl
  tin_man_fountain :tm_water_enclosure, :tm_make_1

  2.times do |ix|    # 2 more enchanted water & 4 minutes
    wait 2
    tin_man_fountain :tm_enchantment_pool  # 1st magic feed
  end

  # harvest small drinking bowl
  tin_man_fountain :tm_water_enclosure

  # make large drinking bowl
  tin_man_fountain :tm_water_enclosure, :tm_make_2

  # wait for enchanted water in next run
  wait 2 unless run_number == count-1
end
