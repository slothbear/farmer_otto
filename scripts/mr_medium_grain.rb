# assume:
# azure emporium is open
# Water Fountain is ready (2 min)
# Feeding Trough is ready (5 min)
# Feeding Enclosure is empty (10 minutes)
# collection bins are empty

activate_farm
count = 100  # 10, 20, 60

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  azure_emporium :ae_water_fountain, :ae_feeding_trough
  wait 2.0
  azure_emporium :ae_water_fountain, :ae_feeding_trough

  # sell previous medium grain
  unless run_number == 0
    azure_emporium :ae_feeding_enclosure # harvest
    # that harvest puts up the upgrade button, which covers over
    # the play_area button. Add click to neutral area to clear
    # upgrade button.
    azure_emporium :ae_title_bar # move off of button dialog
    azure_emporium :ae_play_area, :ae_sell_1
    azure_emporium :ae_sell_accept, :ae_close_play_area
  end

  # make a medium grain
  azure_emporium :ae_feeding_enclosure, :ae_make_2

  # wait for warming lamp in next run
  wait 3 unless run_number == count-1
end
