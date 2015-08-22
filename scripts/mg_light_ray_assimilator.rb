# assume bottom stations are harvestable

# light ray assimilator = (2 hours)
# 1 high score card (2 min from Hanging Fountain)
# 2 wishing quarter (3 min from Storybook Wishing Well)

# high score card = (2 min)
# 2 charmed water (2 min from Infinity Bird Bath)
# 1 wishing quarter (3 min from Storybook Wishing Well)

magic_garden

harvest :infinity_bird_bath       # for charmed water, 2 min
harvest :storybook_wishing_well   # for wishing quarter, 3 min
wait 2                            # wait for next charmed water
harvest :infinity_bird_bath
open :hanging_fountain
make :high_score_card             # takes 2 minutes
wait 2

harvest :storybook_wishing_well
wait 3
harvest :storybook_wishing_well

unless first_run?
  harvest :arcade_machine
  sell :sell_spot_1
end

harvest :hanging_fountain         # high score card
open :arcade_machine
make :light_ray_assimilator

wait (120-2-2-3) unless last_run?
