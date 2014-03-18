# assume:
# lumber mill ready (3 minutes)
# supply shop ready (8.5 minutes)
# wood sheet takes 2 planks (5 minutes)
# max zoom out, then full-screen, then un-full-screen
# (full-screen changes positions of farm slightly)

# 4 open spots for
# 1 wood sheet (2 wood planks)
# 3 basic nails
# however many horses we've made until we autodelete

wait 0.1
activate_farm

count = 15
count.times do |run_number|
  farmers_square :lumber_mill
  wait 0.1
  farmers_square :supply_shop
  wait 3

  farmers_square :lumber_mill
  wait 0.1 # farmer to get to mill, harvest
  farmers_square :my_workshops
  wait 0.1

  # Get horse from made on previous iteration
  farmers_square :mw_get_it unless run_number == 0

  farmers_square :mw_make_it
  wait 0.1
  farmers_square :mw_close
  wait 5.5 # max of sheet (5) and nail (5.5) to finish

  farmers_square :supply_shop
  wait 8.7 # 8.5 time for nail + .2 cuz it's never quite ready
  farmers_square :supply_shop # 3rd nail
  wait 0.1 # farmer to get to supply shop, harvest

  farmers_square :my_workshops
  wait 0.1
  farmers_square :mw_get_it # wood sheet
  wait 0.1
  farmers_square :childs_rocking_horse
  farmers_square :mw_make_it
  wait 0.1
  farmers_square :mw_close

  wait 8.5 # for next nail to finish
end
