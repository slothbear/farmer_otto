wait 0.1
activate_farm

count = 12

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  #TODO: should script have a #click command?
  harvest_basic_nail
  wait 9
end