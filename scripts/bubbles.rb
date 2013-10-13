# assume:
# apothecary is open
# bubble brew is ready
# brewing cauldron is ready
# 0 items in potion cabinet
# potion cabinet holds 10 units

sleep 5.0
count = 10

count.times do
  apothecary :harvest_brewing_cauldron
  apothecary :harvest_dragon_brewer
  apothecary :harvest_dragon_brewer
  apothecary :make_blue_bubble_brew
  sleep 124.0
end
