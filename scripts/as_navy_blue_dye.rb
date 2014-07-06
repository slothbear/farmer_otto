# assume:
# Arabian Stallions is open
# Facebook window is at narrowest
# Brown bar under blue button bar is visible
# (activate_farm area above brown bar is visible)
# Desert Flowers ready (4 min)
# Enclosure Pen is near full (4/5)

# Navy Blue Dye produced in Dye Shop
# Navy Blue Dye = 3 Coloured Dye (4 hours)

# need a verb or directive here? "environment arabian_stallions"?
arabian_stallions

# harvest :desert_flowers
# wait 4
# harvest :desert_flowers
# wait 4
# harvest :desert_flowers

puts "first run is: #{first_run}"

unless first_run
  # harvest :dye_shop
  sell :sell_spot_5
end

# open :dye_shop
# make :navy_blue_dye

# Navy Blue Dye (240 min) minus 8 min to pre-make next parts
wait 232 unless last_run
