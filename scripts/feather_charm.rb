wait 0.1

count = 5
count.times do |run_number|
  jungle_hideaway :jungle_feather_nest
  wait 3
  jungle_hideaway :jungle_feather_nest
  wait 3
  jungle_hideaway :jungle_feather_nest

  # have all 3 feathers now
  # harvest item. 2nd call to roost
  # hits empty space on first run since no previous item
  # or, leave the last item in place after quitting
  # the previous run (which will leave one)
  jungle_hideaway :jungle_bird_roost
  jungle_hideaway :jungle_bird_roost
  jungle_hideaway :jungle_make_1

  # this wait plus 6 min above = 10 min wait for feather
  wait 4
end
