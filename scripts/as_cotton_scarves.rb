# assume bottom stations are harvestable

arabian_stallions

harvest :mineral_spring  # makes Oasis Water in 2 minutes
harvest :oasis_grove     # makes a Wooden Beam in 3 minutes
wait 3                   # wait for next set of ingredients (max of 2 and 3 min)
harvest :mineral_spring
harvest :oasis_grove     # all ingredients for Carpenters Nails are ready

open :carpenters_hut
make :carpenters_nails   # takes 10 minutes

wait 3
harvest :oasis_grove     # wooden beam #1
harvest :spinning_wheel  # golden cotton
wait 3
harvest :oasis_grove     # wooden beam #2
wait 4                   # 10 minutes for nails - 3 - 3 for beams and cotton

harvest :carpenters_hut  # Carpenters Nails
open :carpenters_hut
make :wooden_trellice    # takes 30 minutes

                         # after the 4-minute wait above
                         # all stations are ready. collect!

harvest :spinning_wheel  # golden cotton #1
harvest :oasis_grove     # wooden beam
wait 3
harvest :spinning_wheel  # golden cotton #2
wait 27                  # 30 minutes for trellice - 3 for cottons & beam

harvest :carpenters_hut  # Wooden Trellice
open :cotton_mill
make :cotton_scarves

# Cotton Scarves (120 min) minus 43 min to pre-make next parts
wait 77 unless last_run?