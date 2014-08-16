# assume bottom stations are harvestable

magic_garden

harvest :infinity_bird_bath # for charmed water, 2 min
harvest :storybook_wishing_well  # for wishing quarter, 3 min
harvest :fairy_mines
wait 2                   # wait for next charmed water

harvest :infinity_bird_bath
open :hanging_fountain
make :high_score_card   # takes 2 minutes

wait 1
harvest :fairy_mines

wait 3
harvest :fairy_mines  # 3 alchemist powder now
harvest :hanging_fountain  # high score card
open :alchemist_hat
make :pixie_rabbit    # takes 10 minutes

unless first_run?
  open :play_area
  sell :sell_spot_1
end

wait 4 unless last_run?
