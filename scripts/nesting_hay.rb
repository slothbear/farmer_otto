# assume:
# tin man fountain is open
# Winkie Rookery is ready (3 min)
# Rookery Enclosure is empty (10 minutes)
# collection bins are empty

activate_farm
count = 300

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  tin_man_fountain :tm_winkie_rookery
  wait 3.0
  tin_man_fountain :tm_winkie_rookery
  wait 3.0
  tin_man_fountain :tm_winkie_rookery

  # sell previous nesting hay
  unless run_number == 0
    tin_man_fountain :tm_rookery_enclosure # harvest
    # that harvest puts up the upgrade button, which covers over
    # the play_area button. Add click to neutral area to clear
    # upgrade button.
    tin_man_fountain :tm_title_bar # move off of button dialog
    tin_man_fountain :tm_play_area, :tm_sell_1
    tin_man_fountain :tm_accept, :tm_close_play_area
  end

  # make a nesting hay
  tin_man_fountain :tm_rookery_enclosure, :tm_make_1

  # wait for Enchanted Egg in next run
  wait 4 unless run_number == count-1
end
