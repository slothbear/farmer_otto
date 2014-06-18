# assume:
# Arabian Stallions is open
# Facebook window is at narrowest
# Brown bar under blue button bar is visible
# (activate_farm area above brown bar is visible)
# Mineral Spring is ready (2 min)
# Oasis Grove is ready (3 min)
# Enclosure Pen is empty (0/5)
# Hayloft is empty (0/10)

# Carpenters Nails produced in Carpenters Hut
# Carpenters Nails = 2 Oasis Water + 2 Wooden Beams (10 min)

# need a verb or directive here? "environment arabian_stallions"?
arabian_stallions

harvest :mineral_spring
harvest :oasis_grove
wait 3

harvest :mineral_spring
harvest :oasis_grove

harvest_and_sell :carpenters_hut unless first_run

open :carpenters_hut
make :carpenters_nails

# Carpenters Nails (10 min) minus 3 min to pre-make next parts
wait 7 unless last_run

