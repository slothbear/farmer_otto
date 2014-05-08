# assume:
# lumber mill ready (3 minutes)
# supply shop ready (8.5 minutes)
# portable chair takes 1 plank, 1 screw
# max zoom out, then full-screen, then un-full-screen
# (full-screen changes positions of farm slightly)

# 3 open inventory spots for
# 2 basic nails
# 1 wood plank
# however many chairs we've made until
# we automate deletion
# inventory currently = 30, so perhaps.... 25?

wait 0.1
activate_farm

count = 25
count.times do |run_number|

  farmers_square :supply_shop
  wait 8.5
  farmers_square :supply_shop
  wait 0.1
  # now have 2 nails for screw
  farmers_square :lumber_mill # get plank
  wait 0.1

  farmers_square :my_workshops
  wait 0.1

  # Get item from made on previous iteration
  farmers_square :mw_get_it unless run_number == 0

  # make screw
  farmers_square :supply_shop_tab
  wait 0.1
  farmers_square :supply_shop_screw

  farmers_square :mw_make_it
  wait 12.0 # for screw to finish

  # harvest screw
  farmers_square :mw_get_it
  # now have 1 screw, one plank
  farmers_square :lumber_mill_tab
  wait 0.05
  farmers_square :portable_chair
  wait 0.05
  farmers_square :mw_make_it
  wait 0.05
  farmers_square :mw_close
end
