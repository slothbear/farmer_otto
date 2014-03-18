wait 0.1
activate_farm

# There are currently 15 farms with standard craftshops.
11.times do
  gift_box :open
  gift_box :use_seedling
  gift_box :plant_seedling
end