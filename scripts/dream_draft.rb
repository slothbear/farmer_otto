# assume:
# apothecary is open
# dream draft is ready at Apprentic Enchanter (5 min)
# Blue Bubble Brew ready at Dragon Brewer (2 min)
# brewing cauldron (3 min)
# 1 Bottle Tonic in Potion Cabinet
# Potion Cabinet is empty, holds 10 units

puts "sleeping for 5"
sleep 5.0
count = 10

count.times do
  apothecary :harvest_brewing_cauldron
  apothecary :harvest_dragon_brewer
  apothecary :harvest_dragon_brewer
  apothecary :make_blue_bubble_brew
  apothecary :harvest_apprentice_enchanter
  apothecary :harvest_apprentice_enchanter
  apothecary :make_dream_draft
  sleep 124.0 # wait for 2nd blue bubble brew

  apothecary :harvest_brewing_cauldron
  apothecary :harvest_dragon_brewer
  apothecary :harvest_dragon_brewer
  apothecary :make_blue_bubble_brew
  sleep 184.0
end
