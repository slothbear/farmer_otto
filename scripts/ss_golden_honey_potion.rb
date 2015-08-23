wait 0.1

# Harvest the ready golden honey potions.
spot = [80, 108]
4.times do |count|
  y = spot[1]+count*78
  puts "next harvest: #{[spot[0], y]}"
  click [spot[0], y], 3.0
end

# Clear the requests to share.
4.times do
  click [410, 390], 1.0
end

# Make more.
4.times do
  # make = [630, 256] # spot 1 or .first
  make = [630, 360] # spot 2 or make.second
  click make, 1.0
end
