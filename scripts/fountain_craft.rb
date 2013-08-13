farms = :home, :english, :lighthouse, :winter,
        :hawaiian, :jade, :haunted

current_farm :home

farms.each do |farm|
  travel_to farm

  craftshop :look_inside
  2.times do
    craftshop :get_it
  end

  craftshop :drill_bit
  craftshop :copper_tube
  craftshop :cut_bamboo

  craftshop :close
end
