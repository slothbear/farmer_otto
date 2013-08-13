standard_farm_count.times do
  travel_to_least_recent_farm

  craftshop :look_inside
  2.times do
    craftshop :get_it
  end

  craftshop :drill_bit
  craftshop :copper_tube
  craftshop :cut_bamboo

  craftshop :close
end
