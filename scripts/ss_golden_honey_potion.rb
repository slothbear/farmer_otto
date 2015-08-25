GOODS_COUNT = 5

def finish_goods
  # Harvest the ready golden honey potions.
  spot = [40, 108]
  GOODS_COUNT.times do |count|
    y = spot[1]+count*78
    puts "next harvest: #{[spot[0], y]}"
    click [spot[0], y], 5.0
  end

  # Clear the requests to share.
  GOODS_COUNT.times do
    click [410, 385], 2.0
  end

  # Make more.
  GOODS_COUNT.times do
    make = [608, 245] # spot 1 or .first
    # make = [608, 356] # spot 2 or make.second
    # make = [608, 474]
    click make, 2.0
  end

  # Clear any level up messages.
  2.times do
    click [410, 385], 1.0
  end
end

#main
wait 0.1
12.times do
  finish_goods
  wait 61.0

end
