farms = :home, :english, :lighthouse, :winter, :hawaiian, :jade, :haunted

farms.each do |farm|
  travel_to farm
  craftshop open
  3.times { craftshop get_it }
  craftshop craft, :drill_bit, :copper_tube, :cut_bamboo
  craftshop close
end