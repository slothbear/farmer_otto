wait 0.1

count = 5
count.times do |run_number|
  jungle_hideaway :jungle_feather_nest
  jungle_hideaway :jungle_gold_mine
  wait 3
  jungle_hideaway :jungle_feather_nest

  jungle_hideaway :jungle_bird_roost
  jungle_hideaway :jungle_bird_roost
  jungle_hideaway :jungle_make_1
  wait 27
end
