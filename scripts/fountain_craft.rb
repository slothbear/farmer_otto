farms = :home, :english, :lighthouse, :winter,
        :hawaiian, :jade, :haunted

current_farm :home

farms.each do |farm|
  travel_to farm

  craftshop :look_inside
  3.times { craftshop :get_it }
  craftshop :drill_bit
  craftshop :copper_tube
  craftshop :cut_bamboo
  craftshop :close
end
