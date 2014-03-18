all_farms

# support for this script - torn from lib/farmer_otto.rb

def all_farms
  puts "farm codes\n\n"
  puts @settings['farm_codes']
  puts "other farms\n\n"
  puts @settings['side_farms']
end
