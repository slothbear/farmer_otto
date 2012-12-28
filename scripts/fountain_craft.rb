farms = :home, :english, :lighthouse, :winter,
  :hawaiian, :jade, :haunted

farms.each do |farm|
  travel_to farm
  click :close_farm_cash_offer

  craftshop :look_inside
  3.times { craftshop :get_it }
  craftshop :craft, :drill_bit, :copper_tube, :cut_bamboo
  craftshop :close
end
