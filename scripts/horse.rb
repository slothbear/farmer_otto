# assume:
# elite horses is open
# Feeding Stall is ready (5 min)
# Feed Wagon is ready (2 min)
# 1 Feed already in Stable Loft

sleep 5.0
count = 5

count.times do
  elite_horses :feed_wagon
  elite_horses :feeding_stall
  elite_horses :feeding_stall
  elite_horses :eh_make

  sleep 124.0

  elite_horses :feed_wagon
  sleep 184.0
end
