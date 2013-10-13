puts "sleeping 5"
sleep 5.0
craftshop :open

8.times do
  craftshop :get_it
end

craftshop :cut_bamboo, count: 8

craftshop :close