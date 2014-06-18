# assume:
# Arabian Stallions is open
# Pasture is ready (2 min)
# collection bins are empty

# natural feed bag = 3 enriched grass + fresh cut grass (5 min)
# fresh cut grass = 2 enriched grass (5 min)

activate_farm
count = 59

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  click_arabian_stallions :as_pasture # enriched grass #1
  wait 2.0

  # sell previous large drinking bowl
  unless run_number == 0
    click_arabian_stallions :as_grazing_pasture # harvest
    click_arabian_stallions :tm_title_bar # move off of button dialog
    click_arabian_stallions :as_enclosure_pen, :as_sell_1
    click_arabian_stallions :as_accept, :as_close_enclosure_pen
  end

  click_arabian_stallions :as_pasture # enriched grass #2
  # make a fresh cut grass
  click_arabian_stallions :as_grazing_pasture, :as_make_1

  3.times do |ix|    # 3 more enriched grass & 4 minutes
    wait 2
    click_arabian_stallions :as_pasture
  end

  # harvest fresh cut grass
  click_arabian_stallions :as_grazing_pasture

  # make natural feed bag
  click_arabian_stallions :as_grazing_pasture, :as_make_1

  # wait for enriched grass in next run
  wait 3 unless run_number == count-1
end
