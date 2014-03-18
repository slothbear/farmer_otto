wait 0.1
activate_farm

count = 5
count.times do |run_number|
  hollybright :holiday_wheelbarrow
  wait 3

  hollybright :holiday_wheelbarrow

  hollybright :feeding_enclosure # harvest previous
  hollybright :feeding_enclosure, :hollybright_make_1
  wait 2
end
