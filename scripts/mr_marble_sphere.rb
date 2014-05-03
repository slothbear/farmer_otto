# assume:
# azure emporium is open
# Water Fountain, Masonry Block, and Wooden Loom are ready.
# collection bins are empty

activate_farm
count = 1 # 10, 20, 60

count.times do |run_number|
  puts "... beginning run #{run_number}/#{count}"

  azure_emporium :ae_water_fountain, :ae_masonry_block
  wait 3.0

  # sell previous marble sphere
  unless run_number == 0
    azure_emporium :ae_masonry_enclosure # harvest
    # that harvest puts up the upgrade button, which covers over
    # the play_area button. Add click to neutral area to clear
    # upgrade button.
    # move title_bar jiggle into #azure_emporium
    azure_emporium :ae_title_bar # move off of button dialog
    azure_emporium :ae_play_area, :ae_sell_1
    azure_emporium :ae_accept, :ae_close_play_area
  end

  # make the masonry hammer
  azure_emporium :ae_water_fountain, :ae_masonry_block
  azure_emporium :ae_masonry_enclosure, :ae_make_1

  wait 7.0 # (7+3 = 10 minutes for masonry hammer)

  azure_emporium :ae_masonry_block
  wait 3.0

  # harvest masonry hammer
  azure_emporium :ae_masonry_enclosure
  wait 1.0 # (temp: one time wait for mastery)

  # rest of goods for marble sphere
  azure_emporium :ae_masonry_block, :ae_wooden_loom
  azure_emporium :ae_masonry_enclosure, :ae_make_1

  # wait for marble sphere (minus 3 for next polished stone)
  wait 27 unless run_number == count-1
end
