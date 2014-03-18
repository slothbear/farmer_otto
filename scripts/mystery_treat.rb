wait 0.1

count = 5
count.times do |run_number|
  jungle_hideaway :jungle_wild_fruit_tree
  wait 2
  jungle_hideaway :jungle_wild_fruit_tree

  # harvest previous mystery treat
  # hits empty space on first run since no previous M.T.
  # alternatively, leave the last mystery treat in the grove,
  # after cancelling the previous run (which will leave one)
  jungle_hideaway :jungle_tree_grove
  # make a crate
  jungle_hideaway :jungle_tree_grove, :jungle_make_1
  wait 2
  jungle_hideaway :jungle_wild_fruit_tree
  wait 2
  jungle_hideaway :jungle_wild_fruit_tree
  wait 2
  jungle_hideaway :jungle_wild_fruit_tree

  # make a mystery treat
  jungle_hideaway :jungle_tree_grove
  jungle_hideaway :jungle_tree_grove, :jungle_make_1
  wait 2
  wait 1 # wait for mystery treat to finish, make time for crate


end
