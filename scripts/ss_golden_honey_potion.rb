wait 0.1

# Harvest the ready golden honey potions.
spot = [40, 108]
4.times do |count|
  y = spot[1]+count*78
  puts "next harvest: #{[spot[0], y]}"
  click [spot[0], y], 3.0
end

# Clear the requests to share.
4.times do
  click [410, 385], 1.0
end

# Make more.
4.times do
  # make = [608, 245] # spot 1 or .first
  make = [608, 356] # spot 2 or make.second
  # make = [608, 474]
  click make, 1.0
end

# Clear any level up messages.
2.times do
  click [410, 385], 1.0
end
