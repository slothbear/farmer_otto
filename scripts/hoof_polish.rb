# assumptions:
# Elite Horses is open

# Water Pump has ready Water Pail (2 min)
# Fabric Roll Barrel has ready Linen (3 min)
# Horse Groom has ready Grooming Kit (3 min)

# Stable Loft empty of Resources (10 spots)
# Riding Arena empty of Goods (5 spots)

sleep 5.0
count = 5

count.times do |run_count|
  elite_horses :water_pump
  elite_horses :fabric_roll_barrel
  elite_horses :horse_groom
  # 1 water pail, 1 linen, 1 grooming kit
  sleep 184 # 3 min for GK, 2 for others

  elite_horses :water_pump
  # 2 water pail, 1 linen, 1 grooming kit
  # elite_horses :make_wash_cloth
  elite_horses :water_shed
  # elite_horses :make_wash_cloth
  elite_horses :eh_make_2 #ISITALWYAS 2??

  elite_horses :horse_groom
  # 0 water pail, 0 linen, 2 grooming kit
  sleep 184 # 3 min for GK, 2 for wash cloth

  elite_horses :horse_groom
  # 3 grooming kit, ready wash cloth

  elite_horses :water_shed
  # 3 grooming kit, 1 wash cloth

  elite_horses :grooming_stable
  # elite_horses :make_hoof_polish
  elite_horses :eh_make # hoof_polish

  # sleep 30 min for polish,
  # minus pre-requisite-making-time, 6 min
  # plus fuzz factor, 10 seconds
  # don't sleep on last run, nothing left to do
  sleep (((30-6)*60) + 10) unless run_count == count
end
