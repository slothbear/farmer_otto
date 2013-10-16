# assume:
# apothecary is open
# red remedy is ready
# dragon brewer is ready (2 min)
# spellbook is ready (3 min)
# 0 items in potion cabinet
# potion cabinet holds 10 units

puts "sleeping for 5"
sleep 5.0
count = 10

count.times do
  apothecary :harvest_spellbook,
    :harvest_dragon_brewer,
    :harvest_dragon_brewer,
    :make_blue_bubble_brew

  sleep 184.0
end
