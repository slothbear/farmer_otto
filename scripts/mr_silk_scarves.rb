activate_farm
count = 1 # 10, 20, 60

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  azure_emporium :ae_water_fountain, :ae_wooden_loom
  wait 2.0

  # make the large fountain base
  azure_emporium :ae_water_fountain
  azure_emporium :ae_fountain_enclosure, :ae_make_2

  wait 1  # +1 for next silk
  azure_emporium :ae_wooden_loom
  wait 3.0

  # sell previous item
  unless run_number == 0
    azure_emporium :ae_loom_enclosure # harvest
    # that harvest puts up the upgrade button, which
    # covers the play_area button. Add click to neutral
    # area to clear upgrade button.
    # move title_bar jiggle into #azure_emporium
    azure_emporium :ae_title_bar # move off of button dialog
    azure_emporium :ae_play_area, :ae_sell_1
    azure_emporium :ae_accept, :ae_close_play_area
  end

  # harvest large fountain base
  azure_emporium :ae_fountain_enclosure
  # rest of things for silk scarves
  azure_emporium :ae_wooden_loom
  azure_emporium :ae_loom_enclosure, :ae_make_1

  # wait for item (minus 5 for next run)
  wait 115 unless run_number == count-1
end
