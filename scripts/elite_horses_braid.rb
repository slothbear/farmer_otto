# recipes
#   braids, 10 minutes
#     - 2 grooming kits
#     - 1 curry comb
#     - 1 fabric
#   curry comb, 10 minutes
#     - 2 grooming kits
#     - 2 water pails

# assume:
# Elite Horses is open
# Water Pump is ready (Water Pail, 2 min)
# Horse Groom is ready (Grooming Kit, 3 min)
# Fabric Roll Barrel is ready (Fabric, 3 min)

wait 0.1
activate_farm

# Riding Arena only holds 5 goods
count = 5
count.times do |run_number|
  elite_horses :water_pump, :horse_groom
  wait 7 # wp=2 min, hg=3 min, braid=7 min

  # harvest braids on subsequent runs
  elite_horses :grooming_stable unless run_number == 0

  elite_horses :water_pump, :horse_groom
  # now have 2 water pail, 2 grooming kit
  # ready to make curry comb

  elite_horses :grooming_stable, :eh_make
  # curry comb takes 10 minutes (3 for grooming kit, 7 for rest)

  wait 3 # 1st groom kit for braids
  elite_horses :horse_groom

  wait 7 # groom kit=3, curry comb=7

  elite_horses :grooming_stable #curry comb
  elite_horses :horse_groom
  elite_horses :fabric_roll_barrel

  elite_horses :grooming_stable #open
  elite_horses :eh_make

  wait 3 # for horse_groom at top of list
end

close_farmville_tab
